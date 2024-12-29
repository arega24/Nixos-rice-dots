#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

#---------- PROMPT ----------

# PS1='[\u@\h \W]\$ '
PS1='\u @ \w >> '

#--------- AT LAUNCH --------

clear & 
pfetch

#------ CUSTOM SCRIPTS ------

r(){
	printf "Temp: "
	read temp
	redshift -P -O ${temp}
}
