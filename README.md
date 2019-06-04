# ACI-ICS Lab Manual
*Author: Daniel Elbich*
*Contact: delbich10@gmail.com*

*Getting Started*

ACI is a high powered computing system currently in use at PSU. This is a Linux based system and is best used through the command line (e.g. Terminal, bash shell scripting). There is a GUI (graphical user interface) access to the system which will take you to a Linux desktop for more point and clicker interfacing. It is critical to note that the GUI interface is where low resource tasks should be performed, such as viewing MRI data or working on scripts/data pipelines. More high resource tasks, such as preprocessing a large batch of subject data (e.g. things that will take hours, not minutes) should NOT be run here as they take away computing resources from all users and is against ICS protocols. 

You can get by using the GUI for most things, but at some point it will become more efficient to use the command line to work here. While the system has a specific organization/setup for the university, this type of server is commercially available and employed by many universities. As such, if this manual or the PSU website (https://ics.psu.edu/computing-services/ics-aci-user-guide/) is missing a piece of information, it is very likely you can find it through online searches including ‘aci’ (e.g. “aci loading software”).


*Connecting to ACI*

There are three server addresses that can be used to access the ACI cluster, each with a different purpose:
- aci-b.aci.ics.psu.edu – This address is used to connect to the batch system through terminal. This is where you would submit jobs (see below) for high powered computing. It can only be used with the command line (e.g. no point and click). To connect, enter the following into terminal

```ssh ACCESSID@aci-b.aci.ics.psu.edu```

where ‘ACCESSID’ is your PSU access ID (e.g. dbe5007). You will be prompted to enter your password and also authenticate with Duo.

- aci-i.aci.ics.psu.edu – This address is used to connect to the GUI system to be used for viewing data or code testing. Computationally intensive jobs should NOT be run here, and if this is ignored you risk ICS terminating your job/session & warning you not to do this again. Use the program Exceed OnDemand to connect to the interactive desktop, available for download here (https://ics.psu.edu/userguide/05-00-basics-aci-resources/05-04-connecting-aci/). You will be required to enter your access ID, password, and authenticate with Duo to connect.

- datamgr.aci.ics.psu.edu – This address is used to transfer files to and from ACI. This is the only address that can be accessed with any FTP server (e.g. Filezilla, Cyberduck, Transmit). The aci-b address can also be used to transfer data via the command line, but will not work in any program except terminal. You will be required to enter your access ID, password, and authenticate with Duo to connect.


