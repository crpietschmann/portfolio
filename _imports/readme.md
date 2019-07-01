# Migrate from BlogEngine.NET to Jekyll

Here's how to run the `blogml.rb' script to import the BlogML.xml file:

1. Place the `BlogML.xml` file within this directory. For my use I exported the BlogML from my BlogEngine.NET site used to host http://pietschsoft.com

2. Use the following command to execute the script that will take the BlogML and generate markdown posts within the `_posts` folder within this folder.

```
ruby -r ‘./blogml.rb’ -e ‘Jekyll::BlogML.process()’
```

3. Once the markdown files are generated, then copy them to the `_posts` folder at the root of the Jekyll website to add the content to the Jekyll website.

4. Also, don't forget to copy all your images and other artifacts from the old BlogEngine.NET website to their respective locations within the Jekyll website so all the content is still accessible as appropriate after the migration from BlogEngine.NET to Jekyll.

# Credit

I got a little help with this from the following sources:

- <http://andrewt.com/2016/10/26/moving-from-blogengine-to-jekyll.html>
- <https://gist.github.com/eduncan911/10331596>
- 