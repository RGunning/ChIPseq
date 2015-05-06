#####################################################################################
##   Your Bash profile will work with out the need to edit either of your files:   ##
##                                                                                 ##
##              .bash_profile     or     .bashrc                                   ##
##                                                                                 ##
##   However if you would like to add to your environment settings, feel free      ##
##   to add your settings to this file.                                            ##
##                                                                                 ##
##   If you wish to completely disable all Sanger specfic Environment Variables    ##
##   then you can create the following empty text file at the top level of your    ##
##   unix home directory:                                                          ##
##                                                                                 ##
##                       .no_bashrc                                                ##
##                                                                                 ##
##   WARNING: Once created you will nolonger source any sanger environmental       ##
##            settings.                                                            ##
##                                                                                 ##
##   If you wish to discuss your setup requirements or just need advice then       ##
##   please contact helpdesk and we can help get you set up.                       ## 
##                                                                                 ##
##         Email: helpdesk@sanger.ac.uk  or  Phone: 7999 (01223 495300)            ##
##                                                                                 ##
#####################################################################################
 

# FARM group settings
export LSB_DEFAULTGROUP=team113

# PATH
PATH="/nfs/users/nfs_r/rg12/WrapperScripts:/nfs/users/nfs_r/rg12/bin:/nfs/users/nfs_r/rg12/biobambam/bin:$PATH"
PATH="/software/team113/algorithms/bin:/software/team113/algorithms/sailfish/bin:/software/python-2.7.6/bin:/software/gcc-4.8.1/bin:/software/bowtie2/bin:$PATH"
PATH="/software/perl-5.18.1/bin:/software/team113/algorithms/bedtools2/bin:/software/R-3.0.0/bin:$PATH"

PYTHONPATH="/software/team113/algorithms/lib/python2.7/site-packages:$PYTHONPATH"
LD_LIBRARY_PATH="/software/boost-1.53/lib:/nfs/users/nfs_r/rg12/perl5/lib:/software/perl-5.18.1/lib:/software/gcc-4.8.1/lib:/software/gcc-4.8.1/lib32:$LD_LIBRARY_PATH"
LD_LIBRARY_PATH="/software/gcc-4.8.1/lib64:/software/team113/algorithms/sailfish/lib:/nfs/users/nfs_r/rg12/lib:/software/R-3.0.0/lib:$LD_LIBRARY_PATH"

PKG_CONFIG_PATH="/nfs/users/nfs_r/rg12/libgtextutils-0.7:$PKG_CONFIG_PATH"


export PERL5LIB="/nfs/users/nfs_r/rg12/perl5/lib/perl5:$PERL5LIB"
export PATH
export PYTHONPATH
export LD_LIBRARY_PATH
export PKG_CONFIG_PATH

PERL_MB_OPT="--install_base \"/nfs/users/nfs_r/rg12/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/nfs/users/nfs_r/rg12/perl5"; export PERL_MM_OPT;

R_LIBS="/nfs/users/nfs_r/rg12/R-modules:$R_LIBS"

