#! /bin/csh -f

#  Prerequisites: None
#
#  Set up links to standard gtds data files
#
    source setup_gtds_std_files_laser_lnx.com
#
#  Replace NASA with our TRAMP timcof
#
#  These are 120 record timcof files
#    rm -f GTDS\$038
#    ln -s $GTDS_LOC/DBS_timcof_TRAMP_1973_2169_3Jan2020.dat         GTDS\$038
#    rm -f GTDS\$014
#    ln -s $GTDS_LOC/DBS_mn2000_de200_TRAMP_1973_2169_3Jan2020.dat   GTDS\$014
#    rm -f GTDS\$078
#    ln -s $GTDS_LOC/DBS_tod2000_de200_TRAMP_1973_2169_3Jan2020.dat  GTDS\$078
# 
#  this script assumes that the executable GTDS module can be found
#  by searching the users search PATH
#
#  Remove any existing links to fortran file 24
#
    rm GTDS\$024 >& /dev/null
#
#  Make link for any output ORB1 file
#
#    ln -s gtds_test_program.orb1   GTDS\$024
#
#  Make links to the observation files
#
#    ln -s gtds_dc_laser_rng.obs         GTDS\$015
#
#  Make the run using input cards in     gtds_dc.gtds
#  Place the output (listing) in         gtds_dc.output
#
    rm GTDS\$005 >& /dev/null
    rm GTDS\$006 >& /dev/null
#
    ln -s gtds_test_program.gtds       GTDS\$005
    ln -s gtds_test_program.output     GTDS\$006
#
    ls -l GTDS\$*

    echo -n 'run started at '
    date
#    /Applications/Emacs.app/Contents/MacOS/Emacs
#
     time  ../exe/gtds_opt0.exe
#
    echo -n 'run ended at '
    date

   ls -l GTDS\$*

   rm GTDS\$*
#
#
#----------------------------------------------------------------------
