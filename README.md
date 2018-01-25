Introduction
It is a Java Web app which can be used to place online Hospital appointments.

Contribute
Please feel free to fork the repository and add modifications. I love pull requests!

Getting Started
To use or edit the project you’ll need the following:

For deploying
Just download the WAR file and database files.
Download Apache Tomcat 8.5 (Preferred) and deploy the WAR file using manager-gui. For help deploying, click here.
Download the MySQL 5.7 database server. Extract the data.zip directory into the MySQL 5.7 install directory. Default ceredentials in the data.zip files are username: root and password: abcd@1234 Alternatively, you can import these files users.txt, party.txt and add tables namely users and party respectively in a database with name ekapp. Read more…
Run the mysqld database service.
For editing
Follow the steps mentioned in the above deployment section.
Open Eclipse IDE. It should have J2EE support. If you don’t have it, you can get it here.
Import the WAR file that you downloaded into eclipse as a new project. Here’s how.
Appendix
Importing a text file as a table in MySQL 5.7
from MySQL 5.7 Reference Manual > LOAD DATA INFILE Syntax

LOAD DATA INFILE 'data.txt' INTO TABLE table2
  FIELDS TERMINATED BY '\t';
Importing WAR file into Eclipse
from Eclipse documentation

To import the Web project resources in a WAR file into your workspace, complete the following steps:

Select File > Import .
In the Import dialog, select WAR file and then click Next.
Locate the WAR file that you want to import using the Browse button.
The wizard assumes you want to create a new Web project with the same name as the WAR file. If you accept this choice, the project will be created with the same servlet version as specified by the WAR file and in the same location. If you want to override these settings, you can click New and specify your new settings in the Dynamic Web Project wizard.
Click Finish to populate the Web project.
