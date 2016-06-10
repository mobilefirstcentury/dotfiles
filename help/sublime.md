---- Sublime 3 User Guide ----
==============================

Installation
------------
  $ cd ~temp
  $ wget https://download.sublimetext.com/sublime-text_build-3103_amd64.deb
  $ sudo dpkg -i sublime-text_build-3103_amd64.deb

Use
---
	```sh
	$ subl
	```

Console
-------

  'Ctrl+`' : Display the console (Sublime doesn't have a Linux console but a python console...)


Package Management
-------------------
### With Package Control
#### Package Browsing
	# 'Ctrl+Shift+P' in sublime ('Escape' for closing dialog)
	# Enter 'Package Control: Discover Packages'

#### Package Installation
	# 'Ctrl+Shift+P' in sublime
	# Enter 'Package Control: Install Package'
	# Enter part of package name
	# Select package
	# Enter

#### Package Uninstall 
	# 'Ctrl+Shift+P' in sublime
	# Enter 'Package Control: Remove Package'
	# Select package
	# Enter

### Manually
	$ cd ~/dotfiles/.config/sublime-text-3/Packages
	$ git clone <repo-url> 
	$ popd
	$ subl


Syntaxic coloration
-------------------
### markdown

default coloration for markdown is really poor ...
 - install 'Monokai Extended' Package and then select 'Preferences > Color Scheme > Monokai Extended > Monokai Extended'
 - install 'Markdown Extended' Package and then select 'View > Syntax > Markdownn Extended'

Project Creation
----------------
### In Sublime
	# create project directory
	$ subl
	# 'File > Open Folder... ' and select project directory
	# 'Project > Save Project As...' in <project-directory>/<project-name>.sublime-project

### from the shell
    # create project directory
    # create a file <project-directory>/<project-name>.sublime-project with the following minimal content:
    ```json
    {
		"folders":
		[
			{
				"path": "."
			}
		]
	}
	```
	$ subl <project-directory>/<project-name>.sublime-project

 Build System
 ------------
	 Configuration of a automatic [build system](http://sublime-text-unofficial-documentation.readthedocs.org/en/latest/reference/build_systems.html).

### Per Project Build System Configuration
	**note** this setup is much better than 'Global Build System Configuration' as the configuration file can be versionned in the git manager.*

	Enter in <project-directory>/<project-name>.sublime-project the specific build system description:

	**example** 
	```json
	{
		"folders":
		[
			{
				"path": "."
			}
		],

		"build_systems": 
		[
			{
				"name": "Project",
				"variants": [
					{
						"name" : "Run Tests",
						"shell_cmd" : "npm test -s"
					},
					{
						"name" : "ES2015",
						"shell_cmd": "npm ES2015 -s"
					}
				]
			}		
		]
	}

	```
	$ subl <project-directory>/<project-name>.sublime-project

### Global Build System Configuration
 	1. Click 'Tools > Build System > New Build System'
 	2. Write shell build commands in a JSON format and save in '~/dotfiles/.config/sublime-text-3/Packages/User/<build-name>.sublime-build'
 		2.1 Simple Build
	 	
		 	# Hello.sublime-build
		 	```json
		 	{
			  "shell_cmd": "echo Hello Word!; ls",
			  "working_dir": "/home/rachid/"
		    }
		    ```

		    or 
		    ```json
		    #Gulp.sublim-build
		    {
			    "shell_cmd": "gulp"
			    "working_dir": "${project_path:${folder}}"
			}
			```
			or
		    ```json
		    #Coffee.sublim-build
		    {
			    "shell_cmd": "coffee \"$file\""
			}
			```

			Activate & Execute New Build System
				- Selec 'Tools > Build System > Hello'
				- Click on 'Tools > Build' or 'Ctrl+B'
				- Build results are displayed in the console 

		2.2 Build With Variants

		    ```json
		    #Node.sublim-build
		    {
		    	"variants" : [
			    	{
			    		"name": "node-coffee",
			    		shell_cmd": "coffee \"$file\""
			    	},
			    	{
			    		"name": "node-js",
			    		shell_cmd": "node \"$file\""
			    	}			    	
			    ]
			}
			```
			Activate & Execute the new Build System
				- Selec 'Tools > Build System > Node'
				- Click on 'Tools > Build With' or 'Ctrl+Shift+B'
				- Select one of the Variants
				- Build results are displayed in the console 
				- Subsequent 'Build' (or Ctrl+B) will will build last selected Variant
