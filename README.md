# umate-tool
Ultimate Support Tool (umate-tool) was written to be used to automate tasks of a Linux web hosting technician.  

It can scan a directory structure for popular dynamic web applications and was written while I worked as a Technical Support representative at Web Hosting Company in Sofia, Bulgaria.

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

You can use the tool through a SSH Connection to a server/hosting account that needs to be scanned. 

  1. Simply entering this command will "display the help information" of the script:

    - wget https://raw.githubusercontent.com/Ggd07/umate-tool/master/umate-tool.sh; chmod +x ./umate-tool.sh; ./umate-tool.sh; rm ./umate-tool.sh

  2. Scan directories further in the directory structure for applications and show their locations and versions.

    - wget https://raw.githubusercontent.com/Ggd07/umate-tool/master/umate-tool.sh; chmod +x ./umate-tool.sh; ./umate-tool.sh -i; rm ./umate-tool.sh

  3. Scan directories only for WordPress Applications:

    - wget https://raw.githubusercontent.com/Ggd07/umate-tool/master/umate-tool.sh; chmod +x ./umate-tool.sh; ./umate-tool.sh -w; rm ./umate-tool.sh

  4. Scan directories only for Joomla Applications:

    - wget https://raw.githubusercontent.com/Ggd07/umate-tool/master/umate-tool.sh; chmod +x ./umate-tool.sh; ./umate-tool.sh -j; rm ./umate-tool.sh

  5. Scan directories only for Magento Applications:

    - wget https://raw.githubusercontent.com/Ggd07/umate-tool/master/umate-tool.sh; chmod +x ./umate-tool.sh; ./umate-tool.sh -m; rm ./umate-tool.sh

  6. Scan directories only for Drupal Applications:

    - wget https://raw.githubusercontent.com/Ggd07/umate-tool/master/umate-tool.sh; chmod +x ./umate-tool.sh; ./umate-tool.sh -d; rm ./umate-tool.sh

  7. Scan directories only for PrestaShop Applications:

    - wget https://raw.githubusercontent.com/Ggd07/umate-tool/master/umate-tool.sh; chmod +x ./umate-tool.sh; ./umate-tool.sh -p; rm ./umate-tool.sh

  8. Fix file permissions (set all files and folders to files(644) and folders(755) if they are not set to these permissions):

    - wget https://raw.githubusercontent.com/Ggd07/umate-tool/master/umate-tool.sh; chmod +x ./umate-tool.sh; ./umate-tool.sh -f; rm ./umate-tool.sh
