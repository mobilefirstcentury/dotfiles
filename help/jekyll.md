---- Jekyll User Guide ----
===========================

Installation
------------
**note** The latest stable release (3.x as of 2016) will be installated. It has significant incompatibles changes versus 2.x. So be aware of that when choosing templates. 
  ```sh
  # prerequisite: install ruby, node.js and python (!)
  $ gem install jekyll
  $ gem install jekyll-docs  # allows docs consultation with `jekyll docs`
  ```

Build
-----
  ```sh
  $ jekyll build              # builds the site only once in the `_site` sub-directory
  $ jekyll build --watch      # builds the site in the `_site` sub-directory and rebuilds it after any change
  ```

Serve locally
------------
  ```sh
  $ jekyll serve --watch # serve the site on localhost:4000 and watch for anyy change
  ```

Hosting
--------
### Google Bucket Hosting with custom domain
  + Best production solution:
    - it allows true CNAME adressing (not possible with gitlab repos that allows only URL REDIRECT that are bad for SEO)
    + even if the bucket content must be public, one can't list bucket's content in  the browser:
      - it returns an access denied (Only Programatic access through Google API is possible ...)
      - beware that each file in the bukcet is individually accessible by entering it's url in the browser ...
  + The Mobile First Century site is currently hosted on a google bucket (gs://www.mobilefirstcentury.com)
  + google bucket configuration procedure:
    - verify domain from [Google Webmaster tools](https://www.google.com/webmasters/tools/)
    - on the domain registrar DNS, add CNAME: { Type: CNAME Record, Host: www, Value: c.storage.googleapis.com, TTL: Automatic }
    - create a new project on [ Google Developers Console ](https://console.developers.google.com/)
    - create a new bucket named www.mobilefirstcentury.com
    + on bucket list panel, select the newly created bucket and edit 'Edit default object permissions' properties
      - grant permission to everybody
      - settings: { Entity: User , NAME : allUsers , ACCESS: Reader }

### Google Bucket hosting without custom domain
  - the procedure above can be used to host a web site on a bucket with no custom domain
  + on the Registrar DNS:
    - add : { Type: URL Redirect Record, Host : www, Value : 'http://storage.googleapis.com/www_mobilefirstcentury_com/index.html', TTL: Automatic } / Masked
    - On the browser the the domain will be displayed normally in the adress bar. 
  + the adresse of the site will be : http://storage.googleapis.com/www_mobilefirstcentury_com/index.html :)
  + intra-site relative path links works as expected : '<img src="img/mfc-logo.jpg" >' :)

### Github hosting 
  - [TODO] Refaire toute la manip et détailler la procédure
  - create branch 'gh-pages'
  - commit the jekyll or the plain html website source
  - create a file 'CNAME' containing the domain 
  - create a CNAME on the DNS pointing to the IP address of github


### GitLab
 **Notes** 
 - It's better than Github, Google Storage Bucket or Amazon S3 for PROTOTYPING as because of following features:
   + unlimited free PRIVATE REPOS
   + static website can be hosted freely in a PRIVATE REPO
   + complex build steps with '.gitlab-ci.yml' build file: any static site builders (Jekyll, etc.) with any plugins & options can be used
   + group management (equivalent of github organisation): we can serve a lot of websites on sub-domains: http://nextbigthing.innovationhub.com, http://bigidea.innovationhub.com, etc.
 - create a project <project-name> 
 - create a build file : .gitlab-ci.yml. Examples: 
   + Jekyll Website

      ```yaml
        pages:
          stage: deploy
          image: ruby:2.1
          script:
          - gem install jekyll
          - gem install redcarpet
          - jekyll build -d public
          artifacts:
            paths:
            - public
          only:
          - master`
      ```
  + plain html website

      ```yaml
        pages:
          stage: deploy
          script:
          - mkdir .public
          - cp -r * .public
          - mv .public public
          artifacts:
            paths:
            - public
          only:
          - master
      ```
 - push in master branch: this will trigger the build of website in 'public' (hidden directory!) repo and will serve it with Nginx 
 - check build status on Gitlab's page of the projecti (pending during long long minutes ...)
 - The web site is served on: https://rachidbch.gitlab.io/project-name
 + [TODO] Le site web ne s'affiche pas correctement sur gitlab.com (problème sur le path des fichiers css et sans doute js):
   - lorsque je télécharge les 'artifcats' depuis la page de build, le site s'affiche correctement en local
   - c'est donc un problème de paramétrage sur gitlab ...
   + sur devtools on a un path 'https://rachidbch.gitlab.io/css/main.css' que gitlab refuse de servir alors qu'il sert 'https://rachidbch.gitlab.io/jekyll-pages/css/main.css' 
      - sur l'exemple donné dans la [doc](http://doc.gitlab.com/ee/pages/README.html) le fichier css est bien accessible sur 'https://gitlab-examples.gitlab.io/css/main.css' ...

Deployment
----------
**note** 
 + prerequisites
  - [install Google Cloud SDK](https://cloud.google.com/sdk/)
  - authenticate : `gcloud auth login`
 + the project is deployable:
   - directly with google command line tool gsutils : 
     ```sh
     $ gsutil -m rsync -d -r ./_site gs://www.mobilefirstcentury.com
     ```
   - with a shell script calling gsutils (a command line tool from google included in the gcloud sdk), 
   - with gulp calling the same shell script or with node.js code

### Shell Script method
  # the script builds the site with Jekyll before deploying
  $ deploy.sh

### gulp method
  $ gulp deploy

### node.js method
  - see [this article](http://symboliclogic.io/articles/static-site-for-cheap-on-google-cloud-storage/)


Gulp workflow
-------------
### [TODO]
 - Jouer avec ce starter kit avancé: [Universal Jekyll](https://github.com/Itsyo/Univeral-Jekyll/blob/master/gulpfile.js)
 - integrer Jade depuis [jekyll-gulp-autoprefixer-sass-bourbon-jade-browser-sync](https://github.com/agragregra/jekyll-gulp-autoprefixer-sass-bourbon-jade-browser-sync/blob/master/gulpfile.js)
 - trouver un site web sass & jade et le porter sur Jekyll avec le workflow gulp ci-dessus
 - intégrer un dépployement github page via gulp
