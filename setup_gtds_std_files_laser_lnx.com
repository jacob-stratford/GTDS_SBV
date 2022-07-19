#! /bin/csh -f
#
# shell script to setup links to the standard gtds default datafiles

echo 'setting up links to standard GTDS files'

#The following should be pre-set as an environment variable,
#or set here, if desired.  The following line will over-ride
#any settings in your .cshrc.  

#setenv GTDS_LOC ../data_32b
setenv GTDS_LOC ~/vyoma/data_32b

unalias rm
# remove existing links if they exist
# echo $GTDS_LOC
rm -f GTDS\$001
rm -f GTDS\$002
rm -f GTDS\$008
rm -f GTDS\$013
rm -f GTDS\$014
rm -f GTDS\$023
rm -f GTDS\$025
rm -f GTDS\$038
rm -f GTDS\$039
rm -f GTDS\$041
rm -f GTDS\$047
rm -f GTDS\$048
rm -f GTDS\$059
rm -f GTDS\$075
rm -f GTDS\$076
rm -f GTDS\$078
rm -f GTDS\$089
rm -f GTDS\$114
rm -f GTDS\$055
rm -f GTDS\$056
rm -f GTDS\$099


# Now set up links to binary files
# A lot of the following have multiple options.  Choose wisely.

ln -s $GTDS_LOC/sfdir.dat                      GTDS\$001
ln -s $GTDS_LOC/DBS_atmosden.pc                   GTDS\$002

# Gravity model files
ln -s $GTDS_LOC/dan_potential_low.dat                   GTDS\$008
#ln -s $GTDS_LOC/dan_potential.dat              GTDS\$047
ln -s $GTDS_LOC/EGM96_pot_fld.dat              GTDS\$047
#ln -s $GTDS_LOC/lunarfld_stub.dat              GTDS\$048
#ln -s $GTDS_LOC/dan_potential.dat              GTDS\$049

ln -s $GTDS_LOC/errormsg.dat                   GTDS\$013
#ln -s $GTDS_LOC/gtds.errormsg.dat             GTDS\$013

# Nukem operators
#ln -s $GTDS_LOC/lo_nuk.dat                    GTDS\$023
#ln -s $GTDS_LOC/hi_nuk.dat                    GTDS\$023
#ln -s $GTDS_LOC/me_nuk.dat                     GTDS\$023
ln -s $GTDS_LOC/newcomb_100_50_50.data           GTDS\$023

#ln -s $GTDS_LOC/permanent_elements             GTDS\$025

# Timing coefficients and SLP files (B1950)
#ln -s $GTDS_LOC/DBS_jun2003_timcof.dat         GTDS\$038
#ln -s $GTDS_LOC/DBS_jun2003_tod1950.dat        GTDS\$078
#ln -s $GTDS_LOC/DBS_jun2003_mn1950.dat         GTDS\$014

# Timing coefficients and SLP files (J2000)
#
ln -s $GTDS_LOC/DBS_timcof_TRAMP_1973_2169_3Jan2020.dat         GTDS\$038
ln -s $GTDS_LOC/DBS_tod2000_de200_TRAMP_1973_2169_3Jan2020.dat        GTDS\$078
ln -s $GTDS_LOC/DBS_mn2000_de200_TRAMP_1973_2169_3Jan2020.dat         GTDS\$014

#ln -s $GTDS_LOC/old_tmc.dat                    GTDS\$038
#ln -s $GTDS_LOC/old_std.dat                    GTDS\$078
#ln -s $GTDS_LOC/old_s50.dat                    GTDS\$014

ln -s $GTDS_LOC/DBS_soldat.dat                 GTDS\$059
ln -s $GTDS_LOC/DBS_gencof.dat                 GTDS\$039

#ln -s $GTDS_LOC/file55.dat                     GTDS\$055
#ln -s $GTDS_LOC/file56.dat                     GTDS\$056
#ln -s $GTDS_LOC/file114.dat                    GTDS\$114

# Atmospheric data files
ln -s $GTDS_LOC/jr_nomn_6_2020.dat             GTDS\$075
ln -s $GTDS_LOC/ms90_nomn_8_2003.dat           GTDS\$076
#ln -s $GTDS_LOC/ms90_corr_file.dat             GTDS\$089

# Reference System constant file
ln -s $GTDS_LOC/j2000_csconst.dat             GTDS\$099
#ln -s $GTDS_LOC/b1950_csconst.dat              GTDS\$099

echo 'done setting default links'
