# Blogprabhat
A personal blog website and content management system  using using Java JEE.

The blogging system allows users to view the articles and allows the admin to create/edit/delete articles.

## Feature List

##### For General users
*View the latest 10 articles(index.jsp)
*View the archive of all articles(archive.jsp)
*View a specific article(article.jsp)

##### For Admin
*Login to admin portal
*Add a new article
*View all articles and edit them
*Delete an article

## Local setup
To run the project locally, make sure you have:
* JDK 8+
* Servlet Container( Apache Tomcat, Glassfish, or any other)
* Any relational database and its driver jar file(Oracle, mysql, or any other)

##### Steps :
1. Set up the local database :
	* Create a new database blog
	* Change the `config.java` to have username and passwords of your database.
	* Create an article table by executing the following :
	```
	DROP TABLE IF EXISTS articles;
	CREATE TABLE articles
	(
		id              smallint unsigned NOT NULL auto_increment,
		publicationDate date NOT NULL,                              # When the article was published
		title           varchar(255) NOT NULL,                      # Full title of the article
		summary         text NOT NULL,                              # A short summary of the article
		content         mediumtext NOT NULL,                        # The HTML content of the article

		PRIMARY KEY     (id)
	);
	```
2. Run the project:
	* If you have Eclipse or IntelliJ IDE installed, open the project there, configure the server and run
	* If you have separately installed a servlet container, the put the project on the server and run the server
	* Check the .cnf(or equivalent file) of the server to check the port where it is listening to.
	* Open the browser, and visit : localhost:8080/project_name/index.jsp
	

### For developers :
A better blogging system with additional security is coming soon. It will be developed using Spring framework and
will be including Spring security, Spring JPA, Hibernate ORM and Search along with other cool stuff.
Also, I'll put a post on How I made this project on the upcoming blog.


## Note
I haven't adopted the best practices in this project as it was my first project in Java.
I haven't added the filter chains, encryption for passwords, proper session management and all.
For your benefit, consider adding proper security mechanisms or move to a framework like spring.
	