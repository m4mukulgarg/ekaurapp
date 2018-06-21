# Introduction
It is a Java Web app which can be used place ***Hospital Appointments*** Online.

# Contribute
Please feel free to fork the repository and add modifications. I love pull requests!

# Getting Started
To use or edit the project you'll need the following:
## For deploying
* Just download the [WAR file](https://github.com/m4mukulgarg/ekapp/blob/master/release/ekapp.war) and [database files](https://github.com/m4mukulgarg/ekapp/blob/master/release/data.zip).
* Download [Apache Tomcat 8.5](https://tomcat.apache.org/download-80.cgi) (Preferred) and deploy the WAR file using manager-gui. For help deploying, click here.
* Download the MySQL 5.7 database server. Extract the data.zip directory into the MySQL 5.7 install directory. Default ceredentials in the data.zip files are username: ```root``` and password: ```abcd@1234```
Alternatively, you can import these files [_users.txt_](https://github.com/m4mukulgarg/ekapp/blob/master/release/users.txt), [_party.txt_](https://github.com/m4mukulgarg/ekapp/blob/master/release/party.txt) and  add tables namely ```users``` and ```party``` respectively in a database with name ```ekapp```. [Read more...](#importing-a-text-file-as-a-table-in-mysql-57)
* Run the ```mysqld``` database service.
## For editing
* Follow the steps mentioned in the above deployment section.
* Open Eclipse IDE. It should have J2EE support. If you don't have it, you can get it [here](http://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/oxygen2).
* Import the WAR file that you downloaded into eclipse as a new project. Here's [how](#importing-war-file-into-eclipse).
--------------------------------------------------------------------------------------------------------------------------------
# Appendix
## Importing a text file as a table in MySQL 5.7
from [MySQL 5.7 Reference Manual](https://dev.mysql.com/doc/refman/5.7/en/) > [LOAD DATA INFILE Syntax](https://dev.mysql.com/doc/refman/5.7/en/load-data.html)

```
LOAD DATA INFILE 'data.txt' INTO TABLE table2
  FIELDS TERMINATED BY '\t';
```

## Importing WAR file into Eclipse 
from [Eclipse documentation](https://help.eclipse.org/mars/index.jsp?topic=%2Forg.eclipse.wst.webtools.doc.user%2Ftopics%2Ftwimpwar.html)

To import the Web project resources in a WAR file into your workspace, complete the following steps:

1. Select File > Import .
2. In the Import dialog, select WAR file and then click Next.
3. Locate the WAR file that you want to import using the Browse button.
4. The wizard assumes you want to create a new Web project with the same name as the WAR file. If you accept this choice, the project will be created with the same servlet version as specified by the WAR file and in the same location. If you want to override these settings, you can click New and specify your new settings in the Dynamic Web Project wizard.
5. Click Finish to populate the Web project.
