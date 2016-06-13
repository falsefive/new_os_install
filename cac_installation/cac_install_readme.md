CAC Reader Installation
=======================

Overview
--------
Credit for the majority of the information for these steps goes to 
https://militarycac.com/.

These steps are what I did to get my CAC card working with Ubuntu 16.04.

Steps
-----

### Install Necessary Packages
Per the above linked website, we have to install several packages. I've written
the package names both as listed on the above website and as they're listed
in the repositories.

* `pcsc-lite` -> `libpcsc-perl`; PCSC Smart Cards Library
* `pcsc-ccid` -> `libccid`; Generic USB CCID (Chip/Smart Card Interface Devices) driver.
* `perl-pcsc` -> `libpcsc-perl`; Abstraction layer to smart card readers.
* `pcsc-tools` -> `pcsc-tools`; (Optional) These tools are used to test a PCSC driver, card and reader.

`sudo apt-get install libpcsc-perl libccid pcsc-tools`

### Install CACKey
CACKey allows the reading of the certificates located on CAC cards in order
to access relevant sites.

MilitaryCAC suggests that you'll have to visit forge.mil (which hilariously is
CAC-access-only) to get the program, but you can also find it through
http://www.rkeene.org/projects/info/wiki/161.

* [Download CACKey.](http://cackey.rkeene.org/fossil/wiki?name=Downloads)
    * For Ubuntu/Debian, use one of the 'DEB' entries.
    * For Fedora/RHEL, use one of the 'RPM' entries.
    * In both cases, AMD64 is for x64 architecture, and ix86 is for x86.
* Install the program;
    * `cd ~/Downloads` (or wherever you downloaded the program from.)
    * `sudo dpkg -i cackey_X.Y.Z-a_<arch>.deb` where the numbers and <arch>
    match the version you downloaded.
    * If you receive an error about being unable to create a file, run the
    following to fix it;
        * `sudo mkdir /usr/lib64`

### Install DOD Certificates with Firefox
Download the certificates from [DoD Class 3 PKI](http://dodpki.c3pki.chamb.disa.mil/rootca.html).

* For each of 'Root CA 2 Certificate', 'External Certification Authority (ECA) Root CA Certificate', and 'Download External Certification Authority (ECA) Root CA 2 Certificate';
    * Click on the relevant link.
    * Enable 'This certificate can identify websites' and 'This certificate can identify mail users.'
    * Click OK. If you receive an error stating that you cannot import the certificate, do the following after attempting each certificate the first time;
        * Go to `Preferences -> Advanced -> Certificates -> View Certificates`
        * Scroll down to 'U.S. Government'
        * Select all of the certificates (click the first entry, then shift-click the last to select all at once).
        * Click 'Edit Trust...'
        * Each certificate will pop up with a prompt with the same entries as during the first attempt. Selec the same top two options for each and hit OK.
        * This will achieve the same effect as a proper installation.

### Set Up a Security Device in Firefox
This just tells Firefox where and how it can understand your CAC reader.

* Go to `Preferences -> Advanced -> Certificates -> Security Devices`
* Click 'Load'
* Give the module a name. 'CAC Module' is a commonly accepted name.
* Click 'Browse...'
* Point the browser at your `libcackey.so` file, located at `/usr/lib64/libcackey.so`
* Click 'Open'
* Firefox may or may not throw an alert for some reason. Your new module should be in the list of Security Devices if it was successful.

### Test Your Card Reader
* Remove your CAC from your CAC reader and make sure it's plugged in.
* On the command line, run `pcsc_scan`.
* After a second, you'll be prompted with the following; `Card state: Card removed, `
* This means the program is waiting for you to put your CAC in. Do so.
* If successful, you'll see some output almost ending with `Possibly identified card...`
* If not, you'll need to troubleshoot further.

