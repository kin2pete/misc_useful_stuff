#!/usr/local/bin/bash
###########################################################################################################################
# Setup usage message and args
USAGE="Please supply both a valid version and environment. USAGE:  $0 -v|--version(=|:) <version> -e|--env(=|:) <(prod|stage)>"
#
###########################################################################################################################

# optimp:
# -short
# -short<space>arg
# --long
# --long<space>arg
# --long<equals>arg

# optspec:
# -short
# --long

# optdef:
# :optspec[,optspec]* required with argument
# optspec[,optspec]*[^default]: optional with/without default
# ^optspec[,optspec] optional, no argument required. any args supplied ignored or treated as unknown option if not parseable

# argsdef:
# optdef[<space>optdef]* optimp[<space>optimp]*

# Stores all specified opts 
declare -A specified_opts
declare -A specified_opt_names
###############################

declare -A opt_defs_required
declare -A opt_defs_optional
declare -A opt_defs_flag

while true ; do
    case "$1" in
        :-*)
            temp=`echo $1 | cut -d ":" -f 2`;
            opt_defs_required[$temp]=$temp
            shift;;
        -*:)
            temp=`echo $1 | cut -d ":" -f 1`;
            opt_defs_optional[$temp]=$temp;
            shift;;
        ^-*)
            temp=`echo $1 | cut -d "^" -f 2`;
            opt_defs_flag[$temp]=$temp;
            shift;;            
        *)  
            args=("$@"); break;;
    esac;
done

osr_count=${#opt_defs_required[@]}
oso_count=${#opt_defs_optional[@]}
osf_count=${#opt_defs_flag[@]}

idx_os=0
idx=1
last="^"
declare -A opt_spec_required_hash
for i in ${opt_defs_required[@]} ; do
    while true ; do
        temp_var=$( echo "[$i]" | cut -d "," -f $idx | cut -d "[" -f 2 | cut -d "]" -f 1)
        idx=$((idx+1))
        opt_spec_required[$idx_os]=$temp_var    
        if [[ -z $temp_var ]] ; then
            opt_spec_required[$idx_os]="^"
            idx=1
            idx_os=$(($idx_os+1))
            break;
        fi        
        if [ "$last" = "$temp_var" ]; then
            opt_spec_required[$idx_os]="^"
            last="^"
            idx_os=$(($idx_os+1))
            break;
        else
            last=$temp_var
        fi
        opt_spec_required_hash[$temp_var]=$i          
        idx_os=$(($idx_os+1))
    done
done


idx_os=0
idx=1
last="^"
for i in ${opt_defs_optional[@]} ; do
    temp="${i/^}"
    if [[ "$i" = "$temp" ]] ; then
        has_default=0
        odo=$i
        default=""
    else
        has_default=1
        default=`echo $i | cut -d "^" -f 2`
        default="^$default"
        odo=`echo $i | cut -d "^" -f 1`
    fi
    while true ; do
        temp_var=$( echo "[$odo]" | cut -d "," -f $idx | cut -d "[" -f 2 | cut -d "]" -f 1)
        idx=$((idx+1))
        opt_spec_optional[$idx_os]="$temp_var$default"   
        if [[ -z $temp_var ]] ; then
            opt_spec_optional[$idx_os]="^"
            idx=1
            idx_os=$(($idx_os+1))
            break;
        fi
        
        if [ "$last" = "$temp_var" ]; then
            opt_spec_optional[$idx_os]="^"
            last="^"
            idx_os=$(($idx_os+1))
            break;
        else
            last=$temp_var
        fi
        idx_os=$(($idx_os+1))
    done
done

idx_os=0
idx=1
last="^"
for i in ${opt_defs_flag[@]} ; do
    while true ; do
        temp_var=$( echo "$i" | cut -d "," -f $idx | cut -d "[" -f 2 | cut -d "]" -f 1)
        idx=$((idx+1))
        opt_spec_flag[$idx_os]=$temp_var       
        if [[ -z $temp_var ]] ; then
            opt_spec_flag[$idx_os]="^"
            idx=1
            idx_os=$(($idx_os+1))
            break;
        fi
        
        if [ "$last" = "$temp_var" ]; then
            opt_spec_flag[$idx_os]="^"
            last="^"
            idx_os=$(($idx_os+1))
            break;
        else
            last=$temp_var
        fi
        idx_os=$(($idx_os+1))
    done
done

count_osr=0
count_oso=0
count_osf=0



process_opts() {

    found_opt=0
    for i in  ${opt_spec_required[@]}; do
        current_osr="$current_osr $i"
        long_form="$i="
        str_1="${2/$i}"
        str_2="${str_1/=}"
        full_arg="$long_form$str_2"
        if [[ "$2"  = "$i" ]] || [[ "$2" = "$full_arg" ]] ; then
           # echo "Found required opt $i"
           found_opt=1
           temp=${opt_spec_required_hash[$i]}
           opt_defs_required[$temp]="^"
           is_opt=1
           current_opt=$i
           if [[ "$a" = "$full_arg" ]] ; then
               current_arg=`echo $a | cut -d "=" -f 2`
               arg_required=0
           else
               arg_required=1
           fi           
        fi           
        if [ "$found_opt" -eq "1" ] && [[ "$i" = "^" ]] ; then
                count_osr=$((count_osr+1))
                found_opt=0
        fi                    
    done 

    found_opt=0
    for i in  ${opt_spec_optional[@]}; do
        oso_temp=`echo [[$i | cut -d "^" -f 1`
        oso_temp2=`echo [[$i | cut -d "^" -f 2`
        oso="${oso_temp/"[["}"
        long_form="$oso="
        str_1="${2/$oso}"
        str_2="${str_1/=}"
        full_arg="$long_form$str_2"
        if [[ "$2"  = "$oso" ]] || [[ "$2" = "$full_arg" ]] ; then
           # echo "Found optional opt $i"
           found_opt=1
           current_opt=$oso
           is_opt=1
            if [[ "$oso_temp" = "$oso_temp2" ]] ; then
                arg_required=1
            else
                current_arg=$oso_temp2
            fi
           if [[ "$a" = "$full_arg" ]] ; then
               current_arg=`echo $a | cut -d "=" -f 2`
           fi
           
        fi    
        if [ "$found_opt" -eq "1" ] && [[ "$i" = "^" ]] ; then
                count_oso=$((count_oso+1))
                found_opt=0
        fi           
    done 

    found_opt=0
    for i in  ${opt_spec_flag[@]}; do
        if [[ "$2"  = "$i" ]] ; then
           # echo "Found flag opt $i"
           found_opt=1
           is_opt=1
           is_flag=1
           current_opt=$i
        fi    
        if [ "$found_opt" -eq "1" ] && [[ "$i" = "^" ]] ; then
                count_osf=$((count_osf+1))
                found_opt=0
        fi           
    done
 
    if [[ "$is_opt" -eq  "0" ]] ; then
       current_arg=$a
    fi   
} 

last_opt=""
expect_arg=0
arg_required=0
for a in ${args[@]}; do

    current_opt="^"
    current_arg="^"
    is_opt=0
    is_flag=0

    if [[ "$arg_required" -eq "1" ]] ; then
       expect_arg=1
    else
       expect_arg=0
    fi
    
    # Process required args
    process_opts "foo" $a
        
    if [[ "$is_opt" -eq "1" ]] &&  [[ "$expect_arg" -eq "1" ]] ; then
        echo "$last_opt requires an argument."
        exit 2
    fi
    
    if [[ "$is_opt" -eq "0" ]] &&  [[ "$expect_arg" -eq "1" ]] ; then
        specified_opts[$last_opt]=$current_arg
        arg_required=0        
    fi
    
    if [[ "$is_opt" -eq "1" ]] ; then
        specified_opts[$current_opt]="^"
        specified_opt_names[$current_opt]=$current_opt
        last_opt=$current_opt     
        if [[ "$current_arg"  != "^" ]] ; then
          specified_opts[$current_opt]=$current_arg
          arg_required=0    
        fi    
        if [[ "$is_flag" -eq "1" ]]; then
          arg_required=0   
        fi
    fi            
done

if [[ "$arg_required" = "1" ]]; then
    if [[ "$current_arg" = "^" ]] ; then
        echo "Option $last_opt requires an argument."
        exit 1
    else
        specified_opts[$last_opt]=$current_arg 
    fi           
fi  

if [ "$count_osr" -ne "$osr_count"  ]; then
    for i in ${opt_defs_required[@]}; do
        if [[ "$i" != "^" ]] ; then
            echo "Missing required option set: $i"    
            exit 1    
        fi
    done
fi







