#!/bin/sh

####Notes & Comments####
help() {
echo ""
echo "Create PBS Scripts"
echo "Daniel Elbich"
echo "Cogntive, Aging, and Neurogimaging Lab"
echo "Created: 3/12/19"
echo ""
echo "Updated: 6/7/19"
echo ""
echo " Creates subject specific PBS job files  for fmriprep to "
echo " submit to batch processing."
echo ""
echo ""
echo "Usage:"
echo "sh createPBSScripts.sh --subjList <textfile> --run"
echo ""
echo " Required arguments:"
echo ""
echo "	    --subjList      Text file containing list of subjects to run (include path to file)"
echo ""
echo " Optional arguments (You may optionally specify one or more of): "
echo ""
echo "      --run   	    Submit PBS job to qsub"
echo ""
echo ""
exit 1
}
[ "$1" = "--help" ] && help

#subs=()
#Arguement check
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
--subjList) subjList="$2"
i=0
while read -r LINE || [[ -n $LINE ]]; do
	subs[i]=$LINE
	let "i++"
done < $subjList
shift # past argument
shift # past value
;;
--run) run=1
shift # past argument
shift # past value
;;
*)    # unknown option
POSITIONAL+=("$1") # save it in an array for later
shift # past argument
;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

#####OTHER PBS FLAGS#####
#Delayed qsub submission line - military time
#PBS -a 2200

for sub in ${subs[@]}; do

PROJECTDIR='/path/to/parent/folder'

##Save pbs text file to directory""
FILE=$PROJECTDIR'/PBS/fmriprep/PBS_fmriprep_'$sub'.txt'

/bin/cat <<EOM >$FILE
#PBS -A open
#PBS -l nodes=2:ppn=8
#PBS -l walltime=36:00:00
#PBS -l pmem=16gb
#PBS -o $PROJECTDIR/PBS/fmriprep/output
#PBS -e $PROJECTDIR/PBS/fmriprep/error
#PBS -N fmriprep_$sub
#PBS -m bae
#PBS -M dbe5007@psu.edu

module use $PROJECTDIR/Software/fmriprep/modules
module load fmriprep/latest

fmriprep $PROJECTDIR/path/to/data $PROJECTDIR/path/to/output participant --participant-label $sub -t dt --fs-license-file $PROJECTDIR/Software/fmriprep/license.txt

EOM

##Optional flag will automatically submit job
if [ -z "$run" ]
then
	echo "PBS job file created. Saving to: "$FILE
else
	echo "PBS job file created. Saving to: "$FILE
	echo "Submitting job..."
	qsub $FILE
fi
done
