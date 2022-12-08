require 'minitest/autorun'
require_relative '../lib/advent_of_code_7.rb'

class TestDay7 < MiniTest::Unit::TestCase
	def setup
	end

	def test_retrieve_sizes_recursively_should_return_the_size_of_the_directory_if_ignore_file_is_true
		root_directory = Directory.new("/")
		root_directory.directories << File.new("file_1", 256)
		root_directory.directories << File.new("file_2", 2048)
		root_directory.directories << File.new("file_3", 4096)
		
		assert_equal [6400], retrieve_sizes_recursively([root_directory], true)
	end

	def test_retrieve_sizes_recursively_should_work_with_more_complicated_layout
		root_directory = Directory.new("/")
		root_directory.directories << Directory.new("a", root_directory)
		root_directory.directories << Directory.new("b", root_directory)
		root_directory.directories << Directory.new("c", root_directory)

		dir = Directory.new("gear")

		dir.directories << Directory.new("third level")
		dir.directories[0].directories << File.new("zter", 1024)
		dir.directories[0].directories << File.new("utek", 2048)
		dir.directories << File.new("qrezr", 32105)
		
		root_directory.directories[0].directories << dir
		root_directory.directories[1].directories << File.new("pip", 7777)
		root_directory.directories[1].directories << File.new("jlp", 10046)
		
		assert_equal [53000, 35177, 35177, 3072, 1024, 2048, 32105, 17823, 7777, 10046, 0], retrieve_sizes_recursively([root_directory], false)
	end

	def test_solve_part_7_1_should_return_the_sum_of_all_directories_size_below_100000
		assert_equal 113554, solve_part_7_1("$ cd /
$ ls
dir home1
14848514 stderr.txt
8504156 tmp.dat
dir home2
$ cd home1
$ ls
dir e
16384 my_file.txt
2557 my_other_file.txt
60205 h.lst
$ cd e
$ ls
dir musics
dir docs
$ cd musics
$ ls
20535 some_pop_song.ogg
$ cd /../home1/e/musics/.././docs/.
$ ls
2060174 df.exe
7214296 very_big_file
$ cd /home2
$ ls
9999 foo
83020 tmp.log
$ cd /
$ ls
5626152 d.ext
$ tree")
	end

	def test_solve_part_7_2_should_return_the_size_of_the_directory_to_delete
		assert_equal 24933642, solve_part_7_2("$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k")
	end
end