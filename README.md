# umate-tool
Ultimate Support Tool (umate-tool) was written to be used to automate tasks of a Linux web hosting technician.  

It can scan a directory structure for popular dynamic web applications and was written while I worked as a Technical Support representative at SiteGround in Sofia, Bulgaria.

The tool supports most of the popular dynamic web applications used on a web hosting environment such as SiteGround.

I. Applications supported:

- WordPress
- Joomla
- Magento
- Drupal
- PrestaShop

II. Actions supported:

1. Scan and display application location as well as information and details about its version. Details include:

  - Name of the application
  - Version of the application
  - Absolute path of the application on the server/ and or environment.
  - Database name associated with that  application's configuration file
  - Database user associated with that  application's configuration file
  - Database password associated with that  application's configuration file
  - Database host associated with that application's configuration file
  - Whether or not the application can communicate with the database (Database connectivity)
  
2. Scan and fix file permissions in the directory structure.

  - Scan and sets all files to (644) and directories to (755) file permissions under linux.
  
III. Options available when launching the tool:

  - "-i" SCAN AND DISPLAY APPLICATION LOCATION
  - "-w" SCAN AND ANALYZE INSTALLED WORDPRESS APPLICATIONS
  - "-j" SCAN AND ANALYZE INSTALLED JOOMLA APPLICATIONS
  - "-m" SCAN AND ANALYZE INSTALLED MAGENTO APPLICATIONS
  - "-d" SCAN AND ANALYZE INSTALLED DRUPAL APPLICATIONS
  - "-p" SCAN AND ANALYZE INSTALLED PRESTASHOP APPLICATIONS
  - "-f" FIX FILE PERMISSIONS (644) AND DIRECTORY PERMISSIONS (755)
  
IV. How to use the tool:
