class FakeComputer

	attr_reader :total_disk_space
	attr_reader :root_directory
	attr_accessor :current_directory

	def initialize(total_disk_space = 70_000_000)
		@root_directory = Directory.new("/")
		@current_directory = @root_directory
		@total_disk_space = total_disk_space
	end

	def current_path
		@current_directory.path
	end

	def go_to_root
		@current_directory = @root_directory
	end

	def go_to_parent
		@current_directory = @current_directory.parent_directory
	end

	def available_disk_space
		total_disk_space - root_directory.size
	end

	def find_biggest_directories_lower_than(max_size)
		retrieve_sizes_recursively([root_directory])
			.filter { |size| size < max_size }
	end
end

class Directory
	attr_reader :name
	attr_reader :directories
	attr_reader :parent_directory

	def initialize(name, parent_directory = nil)
		@name = name
		@directories = []
		@parent_directory = parent_directory || self
	end

	def size
		@directories.map { |f| f.size }.sum
	end

	def directory?
		true
	end

	def path
		return "" if name == "/"
		parent_directory.path + "/" + name
	end

	def to_s
		"#<Directory name=#{name}, number_of_subdirecties=#{directories.size}>"
	end
end

class File
	attr_reader :name
	attr_reader :size

	def initialize(name, size)
		@name = name
		@size = size
	end

	def directory?
		false
	end
end

class ChangeDirectoryCommand

	def initialize(computer)
		@computer = computer
	end

	def apply(args)
		if args == "."
			# nothing to do
		elsif args == ".."
			@computer.go_to_parent
		elsif args.start_with? "/"
			# full path
			@computer.go_to_root
			args.split("/").filter { |element| !element.empty? }.each { |element| apply(element) }
		else
			next_dir = @computer.current_directory.directories.find { |d| d.name == args }
			if next_dir.nil?
				raise "no directory named #{args}"
			elsif !next_dir.directory?
				raise "not a directory"
			else
				@computer.current_directory = next_dir
			end
		end
	end
end

class ListCommand

	def initialize(computer)
		@computer = computer
	end

	def apply(values)
		values.each_line do |line|
			type, name = line.split(" ")
			if type == "dir"
				@computer.current_directory.directories << Directory.new(name, @computer.current_directory)
			else
				size = Integer(type)
				@computer.current_directory.directories << File.new(name, size)
			end
		end
	end
end

class TreeCommand

	def initialize(computer)
		@computer = computer
	end

	def apply(args)
		res = "-- [drwxrwxr-x] /\n" + create_tree(@computer.root_directory, 1)
		res += "\n#{get_number_of_files(@computer.root_directory)} files"
		puts res
	end

	private def create_tree(current_dir, indent_level)
		indentation = "\t" * indent_level
		res = ""
		current_dir.directories.each do |d|
			if d.directory?
				res += "#{indentation} -- [drwxrwxr-x] #{d.name}\n"
				res += create_tree(d, indent_level + 1)
			else
				res += "#{indentation} -- [-rw-rw-r--] #{d.name} (size=#{d.size})\n"
			end
		end
		res
	end

	private def get_number_of_files(current_dir)
		current_dir.directories.map do |d|
			if d.directory?
				get_number_of_files(d)
			else
				1
			end
		end.sum
	end
end

def retrieve_sizes_recursively(directories, ignore_file = true)
	[] if directories.empty?

	directories.filter { |d| ignore_file ? d.directory? : true }
				.flat_map do |d|
		if d.directory?
			[d.size] + retrieve_sizes_recursively(d.directories, ignore_file)
		else
			[d.size]
		end
	end
end

def cleanify_input(input)
	input.lstrip.squeeze(" ").chomp
end

def create_computer_state_from_input(input)
	computer = FakeComputer.new
	cd = ChangeDirectoryCommand.new computer
	ls = ListCommand.new computer
	tree = TreeCommand.new computer

	input.split("$").map { |a| cleanify_input(a) }.filter { |a| !a.empty? }
					.each do |executable_line|

		cmd, args = executable_line.split(" ", 2)

		case cmd
		when 'cd'
			cd
		when 'ls'
			ls
		when 'tree'
			tree
		else
			raise "unknown command #{cmd}"
		end.apply(args)
	end

	computer
end

def solve_part_7_1(input)
	create_computer_state_from_input(input).find_biggest_directories_lower_than(100000).sum
end

def solve_part_7_2(input)
	needed_free_space_for_update = 30_000_000

	computer = create_computer_state_from_input(input)

	needed_space_to_free = needed_free_space_for_update - computer.available_disk_space

	if needed_space_to_free <= 0
		# already enough space, nothing to free
		return 0
	end

	retrieve_sizes_recursively(computer.root_directory.directories)
			.filter { |size| size > needed_space_to_free }
			.min
end

if __FILE__ == $0
	puts solve_part_7_1(ARGF.readlines.join)
end