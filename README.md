# umate-tool
Ultimate Support Tool (umate-tool) was written to be used to automate tasks of a Linux web hosting technician.  

It can scan a directory structure for popular dynamic web applications and was written while I worked as a Technical Support representative at SiteGround in Sofia, Bulgaria.

The tool supports most of the popular dynamic web applications used on a web hosting environment such as SiteGround.

###################################################################################
#                            ULTIMATE SUPPORT TOOL v1.0                           #
#                                   WRITTEN  BY                                   #
#                       GEORGI GEORGIEV DIMITROV (GGD07.com)                      #
#                           FOR VARIOUS WEB APPLICATIONS                          #
#                                                                                 #
#                           CONTACT: GGD07COM@GMAIL.COM                           #
#                                                                                 #
###################################################################################
# Ultimate Support Tools written to be used to automate work as Technical Support #
#    Copyright (C) 2015  Georgi Georgiev Dimitrov (Ggd07.com)                     #
#                                                                                 #
#    This program is free software: you can redistribute it and/or modify         #
#    it under the terms of the GNU General Public License as published by         #
#    the Free Software Foundation, either version 3 of the License, or            #
#    (at your option) any later version.                                          #
#                                                                                 #
#    This program is distributed in the hope that it will be useful,              #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of               #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                #
#    GNU General Public License for more details.                                 #
#                                                                                 #
#    You should have received a copy of the GNU General Public License            #
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.        #
###################################################################################

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

  -i SCAN AND DISPLAY APPLICATION LOCATION
  -w SCAN AND ANALYZE INSTALLED WORDPRESS APPLICATIONS
  -j SCAN AND ANALYZE INSTALLED JOOMLA APPLICATIONS
  -m SCAN AND ANALYZE INSTALLED MAGENTO APPLICATIONS
  -d SCAN AND ANALYZE INSTALLED DRUPAL APPLICATIONS
  -p SCAN AND ANALYZE INSTALLED PRESTASHOP APPLICATIONS
  -f FIX FILE PERMISSIONS (644) AND DIRECTORY PERMISSIONS (755)
  
IV. How to use the tool:
