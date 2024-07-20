
# Lake Afton Public Observatory - Volunteer Handbook

[![Deploy Hugo site to Pages](https://github.com/lake-afton-public-observatory/lapo-volunteer-handbook/actions/workflows/hugo.yml/badge.svg)](https://github.com/lake-afton-public-observatory/lapo-volunteer-handbook/actions/workflows/hugo.yml)

This project consists of static web pages providing information for Lake Afton Public Obversatory volunteers.s

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [Build and Deployment](#build-and-deployment) below for notes on how to deploy the project on a live system.


### LAPO Volunteer Handbook Documents 

Use the `Review Block` (_see section below_) at the bottom of each page within these Documents to track Review and remaining tasks for the content of the page.  @mention specific project team members to capture their attention that input is needed to clarify and review the content (example below):

### Hugo Static Web Site Framework

[Documentation](https://gohugo.io/documentation/) and Quick Reference:

[List Draft Pages](https://gohugo.io/commands/hugo_list_drafts/):

> ```cmd
> hugo list drafts [flags]
> ```

### Review Block
---
<span style="color:red;font-weight:bold;">
<i>Use the following HUGO Front Matter tags (located at very top of document) to indicate the status of last reviewed, reviewer and any note related to content:</i>
</span>

```
lastmod: "2024-07-18"
reviewer: "Chris Ketron"
notes: "TODO: This is an example `Review Block` to track content review of pages within the Documents. @Chris.Ketron: Please review this document"
---
```

This information will be used to produce the `Review Block` that you see below (automatically produced when Hugo renders static pages):  

|Review Block|   |
|---|---|
|Last reviewed|	2024-07-18|
|Reviewed by| Chris Ketron|
|Notes|TODO: This is an example `Review Block` to track content review of pages within the Documents. @Chris.Ketron: Please review this document|


=== === === 

## Build Environment

This project was built using the following environment components:

[Visual Studio Code](https://code.visualstudio.com/)

[Git for Windows](https://git-scm.com/download/win)

[Python 3.10.5](https://www.python.org/downloads/)

## Project Setup

The following are the steps I used to create the fresh LAPO Volunteer Handbook project, 
and these notes can be used for creating a fresh, brand-new project.
However, if you are just cloning the existing ELAPO Volunteer Handbook project from GitHub, then you can skip these steps and go directly to [Clone this Project](#clone-this-project)
 	
### Virtual Environment

Create a virtual environment for the LAPO Volunteer Handbook Project.  
Begin by creating a directory for the Python virtual environment;

Example... from within your lapo-volunteer-handbook project folder

```
virtualenv venv
```

#### Activate the virtual environment:

You can do this from any folder location, recommend from your local github\lapo-volunteer-handbook project folder

```
venv\Scripts\activate.bat
```

## Prerequisites

See the pip-dependencies.txt file for the Python package requirements for the LAPO Volunteer Handbook:

### Install Python Packages

**Short-cut**: to install *ALL* pip dependencies:
The following *must* be done from your local github\lapo-volunteer-handbook project folder, where the pip-dependencies.txt exists...

```python
pip install -r pip-dependencies.txt
```

### Start Hugo Server - for local testing

To start the Hugo dev server for testing.
From the lapo-volunteer-handbook folder, execute the following command

	hugo server -D

You can then open the local site (url displayed in the output from above conmand) for testing:<br/>
	
## Clone this Project

From the GitHub repository: https://github.com/lake-afton-public-observatory/lapo-volunteer-handbook.git
select Clone and copy the URL to the repo.

Then from your local project folder (I am using c:\git\github), execute the following git command:

```git
git clone https://github.com/lake-afton-public-observatory/lapo-volunteer-handbook.git
```

## Build and Deployment

Once all editing has been completed, do a final build of the document site for deployment

```
hugo
```

This command will generate the various pages from the markdown files and place them in the "public" sub-directory. This is the folder that contains the generated static website and should be copied to the deployment destination.

You can use the Python Simple HTTP server that comes with Python to start up a local server.
Change directory into the Site folder and execute the following:

```
python -m http.server 8080
```

Then visit the site by visiting the following address in your browser:

[http://127.0.0.1:8080/](http://127.0.0.1:8080/)

## Simplified Deployment

Once the build has completed, a **public** folder will be found in your project repo folder.

This **public** folder now contains the resources for a static website deployment.  Copy the contents to a destination server and execute the startLAPOHandbook.bat for the target browser to host the notes locally.

## Versioning

For the sake of tracking version history, the version numbering will follow a year, month, date numbering sequence, following by a sequence id to account for multiple versions within a single date, in the following format:

	yyyy.MM.dd.#
	e.g.,...  2024.07.18.0

Use this versioning strategy when applying label to the source.

## Contributing

Please submit any questions or suggestions regarding content to the Lake Afton Public Observatory Board of Directors @mailto:board@lakeafton.com.  

## Authors

This Lake Afton Public Observatory Volunteer Handbook has been compiled, reviewed and approved by the Lake Afton Public Observatory Board of Directors.

## Testing Locally

- Download the latest zipped Hugo executable from Hugo [Release](https://github.com/gohugoio/hugo/releases).
- Extract the zip into your C drive for eg. `C:\hugo`
- Add the `hugo.exe` executable to your PATH.
- Open a new cmd prompt window and you should now be able to run `hugo version` command. If you get "hugo command not found" , please make sure you have configured the PATH correctly.
- In the command prompt, navigate to the root of the folder where you have cloned this repo.
- Once you are inside handbook folder, run `hugo server -D` and you should see the below output.

```

C:\Users\{user-id}\handbook>hugo server -D

Start building sites …
hugo v0.88.1-5BC54738 windows/amd64 BuildDate=2021-09-04T09:39:19Z VendorInfo=gohugoio

                   | EN
-------------------+------
  Pages            | 199
  Paginator pages  |   0
  Non-page files   |  16
  Static files     |   3
  Processed images |   0
  Aliases          |  17
  Sitemaps         |   1
  Cleaned          |   0

Built in 743 ms
Watching for changes in C:\Users\{user-id}\handbook\{archetypes,content,themes}
Watching for config changes in C:\Users\{user-id}\handbook\config\_default, C:\Users\{user-id}\handbook\config\development
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/handbook/ (bind address 127.0.0.1)
Press Ctrl+C to stop

```

- Open the browser and navigate to the localhost url which is generated in above logs and you should be able to see the site load.
- Press `ctrl+c` to stop the local dev server.
