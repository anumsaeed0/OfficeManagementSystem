#!/bin/bash

AutoNumber()
{
	local emp=0     
        f=0
        for j in `cat Employee.txt`
        do
        emp=$(echo "$j" | cut -d "," -f 1)
                 f=1
        done
        if [ $f = 1 ]
        then
       		 emp=`expr $emp + 1`
        else
        	 emp=1
        fi
        echo $emp
}



Insert()
{
        printf "Fill in the following form : "
	printf "\nEmp_ID : "
	AutoNumber
	read emp;
	printf "First_Name : "
	read first
	printf "Last_Name : "
	read lastn
	printf "Address : "
	read ad
	printf "Age : "
	read age
	printf "Gender : "
	read gndr
	printf "Department : "
	read dept
	printf "Salary : "
	read sal
	printf "Designation : "
	read des
	printf "Joining_year : "
	read joining
	printf "Total Extra Hours Worked in a week:"
	read hoWrk
	echo "$emp,$first,$lastn,$ad,$age,$gndr,$dept,$sal,$des,$joining,true,$hoWrk" >> Employee.txt
	printf "\nRecord is successfully added."; 
	printf "\nEnter any key to go back..."; 
	read a
}

Display()
{
            printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
            echo "          		                    Employee Details "
            printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
            printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\t\tAge\tGender\tDepartment\tSalary\tDesignation\tJoining_Date\n";
            printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
            for j in `cat Employee.txt`
            do
                        emp=$(echo "$j" | cut -d "," -f 1)
                        first=$(echo "$j" | cut -d "," -f 2)
                        lastn=$(echo "$j" | cut -d "," -f 3)
                        ad=$(echo "$j" | cut -d "," -f 4)
                        age=$(echo "$j" | cut -d "," -f 5)
                        gndr=$(echo "$j" | cut -d "," -f 6)
                        dept=$(echo "$j" | cut -d "," -f 7)
                        sal=$(echo "$j" | cut -d "," -f 8)
                        des=$(echo "$j" | cut -d "," -f 9)
                        joining=$(echo "$j" | cut -d "," -f 10)
                        tfval=$(echo "$j" | cut -d "," -f 11)
                        if [ $tfval = "true" ]
                        then
                                  printf "$emp\t$first\t\t$lastn\t\t$ad  \t$age\t$gndr\t$dept  \t$sal\t$des\t$joining\t\t\n"
                        fi
            done
            printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
}

Search()
{ 
            echo "Enter Employee ID:"
            read ID

            echo "__________________________________________________"                       
            echo "                 Employee Details                       "
            echo "__________________________________________________"                       
            flag=0
            for j in `cat Employee.txt`
            do
                        emp=$(echo "$j" | cut -d "," -f 1)
                        first=$(echo "$j" | cut -d "," -f 2)
                        lastn=$(echo "$j" | cut -d "," -f 3)
                        ad=$(echo "$j" | cut -d "," -f 4)
                        age=$(echo "$j" | cut -d "," -f 5)
                        gndr=$(echo "$j" | cut -d "," -f 6)
                        dept=$(echo "$j" | cut -d "," -f 7)
                        sal=$(echo "$j" | cut -d "," -f 8)
                        des=$(echo "$j" | cut -d "," -f 9)
                        joining=$(echo "$j" | cut -d "," -f 10)
                        tfval=$(echo "$j" | cut -d "," -f 11)
                        if [ $ID -eq $emp ] && [ $tfval = "true" ]
                        then
				flag=1
				echo "____________________________________________________________" 
				echo "  Emp_ID  		 :	 	         $emp        "             
				echo "  First_Name 	     	 : 		     	 $first "                    
				echo "  Last_Name		 : 		     	 $lastn"     
				echo "  Address                 :                      $ad   "
				echo "  Age                     :                      $age   "
				echo "  Gender                  :                      $gndr   "
				echo "  Department              :                      $dept"
				echo "  Salary                  :                      $sal   "
				echo "  Designation             :                      $des   "
				echo "  Joining_year            :                      $joining   "				
				echo "____________________________________________________________"
                        fi
            done
            if [ $ID != $emp ]
            then
                 echo "               No Record Found              "
            fi
            echo "__________________________________________________"                          

}
SpecOper()
{
		choice2=1
		while [ $choice2 != "15" -a $choice2 -gt "0" -a $choice2 -le "15" ]
		do
			echo "1. Display Details of Employees of a Specific Department."
			echo "2. Display Details of all employees of a specific designation."
			echo "3. Display Details of Employees joined in a specific year." 
			echo "4. Display Details of All Male/Female Employees."
			echo "5. Display Detail of employee whose salary is greater than a specific number with the corresponding details."
			echo "6. Display Salary of All Employees. "
			echo "7. Display Employee Details by its name."
			echo "8. Display in Alphabetical order."
			echo "9. Display income in Dollar from the Extra Working Hours in a week."
			echo "10. Back. "
			echo -e "Your Choice : \c"
			read choice2
			case $choice2 in
			1)  echo "Enter Department:"
			    read depart

			    printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
            		    echo "          		                    Employee Details "
			    printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
            		    printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\t\tAge\tGender\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			    printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
			    flag=0
			    for j in `cat Employee.txt`
			    do
				        emp=$(echo "$j" | cut -d "," -f 1)
				        first=$(echo "$j" | cut -d "," -f 2)
				        lastn=$(echo "$j" | cut -d "," -f 3)
				        ad=$(echo "$j" | cut -d "," -f 4)
				        age=$(echo "$j" | cut -d "," -f 5)
				        gndr=$(echo "$j" | cut -d "," -f 6)
				        dept=$(echo "$j" | cut -d "," -f 7)
				        sal=$(echo "$j" | cut -d "," -f 8)
				        des=$(echo "$j" | cut -d "," -f 9)
				        joining=$(echo "$j" | cut -d "," -f 10)
				        tfval=$(echo "$j" | cut -d "," -f 11)
				        if [ "$depart" = "$dept" ] && [ $tfval = "true" ]
				        then
						flag=1
						printf "$emp\t$first\t\t$lastn\t\t$ad  \t$age\t$gndr\t$dept  \t$sal\t$des\t$joining\t\t\n"
				        fi
			    done
			    if [ "$depart" != "$dept" ]
			    then
				 echo "               No More Record Found              "
			    fi
			    printf "\n------------------------------------------------------------------------------------------------------------------------------\n" ;;                          

			2) 	echo "Enter Designation:"
			   	read dsgntn

				printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
            			echo "          		                    Employee Details "
            			printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
				printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\t\tAge\tGender\tDepartment\tSalary\tDesignation\tJoining_Date\n";
				printf "\n------------------------------------------------------------------------------------------------------------------------------\n"

				flag=0
				for j in `cat Employee.txt`
				do
					emp=$(echo "$j" | cut -d "," -f 1)
					first=$(echo "$j" | cut -d "," -f 2)
					lastn=$(echo "$j" | cut -d "," -f 3)
					ad=$(echo "$j" | cut -d "," -f 4)
					age=$(echo "$j" | cut -d "," -f 5)
					gndr=$(echo "$j" | cut -d "," -f 6)
					dept=$(echo "$j" | cut -d "," -f 7)
					sal=$(echo "$j" | cut -d "," -f 8)
					des=$(echo "$j" | cut -d "," -f 9)
					joining=$(echo "$j" | cut -d "," -f 10)
					tfval=$(echo "$j" | cut -d "," -f 11)
				                       
					if [ "$dsgntn" = "$des" ] && [ $tfval = "true" ]
					then
						flag=1
						printf "$emp\t$first\t\t$lastn\t\t$ad  \t$age\t$gndr\t$dept  \t$sal\t$des\t$joining\t\t\n"
					fi
				    done
				    if [ "$dsgntn" != "$des" ]
				    then
					 echo "               No More Record Found              "
				    fi
				    printf "\n------------------------------------------------------------------------------------------------------------------------------\n";;                          

			3)	echo "Enter Joining Year:"
			    	read jyear

			    	printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
            			echo "          		                    Employee Details "
            			printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
			    	printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\t\tAge\tGender\tDepartment\tSalary\tDesignation\tJoining_Date\n";
			    	printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
			    	flag=0
			    	for j in `cat Employee.txt`
			    	do
					emp=$(echo "$j" | cut -d "," -f 1)
					first=$(echo "$j" | cut -d "," -f 2)
					lastn=$(echo "$j" | cut -d "," -f 3)
					ad=$(echo "$j" | cut -d "," -f 4)
					age=$(echo "$j" | cut -d "," -f 5)
					gndr=$(echo "$j" | cut -d "," -f 6)
					dept=$(echo "$j" | cut -d "," -f 7)
					sal=$(echo "$j" | cut -d "," -f 8)
					des=$(echo "$j" | cut -d "," -f 9)
					joining=$(echo "$j" | cut -d "," -f 10)
					tfval=$(echo "$j" | cut -d "," -f 11)
					                       
					if [ $jyear -eq $joining ] && [ $tfval = "true" ]
					then
						flag=1
						printf "$emp\t$first\t\t$lastn\t\t$ad  \t$age\t$gndr\t$dept  \t$sal\t$des\t$joining\t\t\n"
					fi
			    done
			    if [ $jyear != $joining ]
			    then
				 echo "               No More Record Found              "
			    fi
			    printf "\n------------------------------------------------------------------------------------------------------------------------------\n";;

			4)	echo "Enter Gender(M/F):"
			    	read gen

			    	printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
            			echo "          		                    Employee Details "
            			printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
				printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\t\tAge\tGender\tDepartment\tSalary\tDesignation\tJoining_Date\n";
				printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
			    	flag=0
			    	for j in `cat Employee.txt`
			    	do
					emp=$(echo "$j" | cut -d "," -f 1)
					first=$(echo "$j" | cut -d "," -f 2)
					lastn=$(echo "$j" | cut -d "," -f 3)
					ad=$(echo "$j" | cut -d "," -f 4)
					age=$(echo "$j" | cut -d "," -f 5)
					gndr=$(echo "$j" | cut -d "," -f 6)
					dept=$(echo "$j" | cut -d "," -f 7)
					sal=$(echo "$j" | cut -d "," -f 8)
					des=$(echo "$j" | cut -d "," -f 9)
					joining=$(echo "$j" | cut -d "," -f 10)
					tfval=$(echo "$j" | cut -d "," -f 11)
					                       
					if [ "$gen" = "$gndr" ] && [ $tfval = "true" ]
					then
						flag=1
						printf "$emp\t$first\t\t$lastn\t\t$ad  \t$age\t$gndr\t$dept  \t$sal\t$des\t$joining\t\t\n"
					fi
			    done
			    if [ "$gen" != "$gndr" ]
			    then
				 echo "               No More Record Found              "
			    fi
			    printf "\n------------------------------------------------------------------------------------------------------------------------------\n";;                          


			5)	echo "Enter The Salary:"
			    	read slry

			    	printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
            			echo "          		                    Employee Details "
            			printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
				printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\t\tAge\tGender\tDepartment\tSalary\tDesignation\tJoining_Date\n";
				printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
			    	flag=0
			    	for j in `cat Employee.txt`
			    	do
					emp=$(echo "$j" | cut -d "," -f 1)
					first=$(echo "$j" | cut -d "," -f 2)
					lastn=$(echo "$j" | cut -d "," -f 3)
					ad=$(echo "$j" | cut -d "," -f 4)
					age=$(echo "$j" | cut -d "," -f 5)
					gndr=$(echo "$j" | cut -d "," -f 6)
					dept=$(echo "$j" | cut -d "," -f 7)
					sal=$(echo "$j" | cut -d "," -f 8)
					des=$(echo "$j" | cut -d "," -f 9)
					joining=$(echo "$j" | cut -d "," -f 10)
					tfval=$(echo "$j" | cut -d "," -f 11)
					                       
					if [ $sal -ge $slry ] && [ $tfval = "true" ]
					then
					        flag=1
						printf "$emp\t$first\t\t$lastn\t\t$ad  \t$age\t$gndr\t$dept  \t$sal\t$des\t$joining\t\t\n"
					fi
			    done
			    if [ $flag = 0 ]
			    then
				 echo "               No Record Found              "
			    fi
			    printf "\n------------------------------------------------------------------------------------------------------------------------------\n";;
				
			6)	printf "\n---------------------------------\n"    
				echo "         Employee Details "
				printf "\n---------------------------------\n"    
				printf "ID\tFirst_N\tLast_N\tSalary";
				printf "\n---------------------------------\n"    
				
				for j in `cat Employee.txt`
				do
					emp=$(echo "$j" | cut -d "," -f 1)
					first=$(echo "$j" | cut -d "," -f 2)
					lastn=$(echo "$j" | cut -d "," -f 3)
					sal=$(echo "$j" | cut -d "," -f 8) 
					tfval=$(echo "$j" | cut -d "," -f 11)
					if [ $tfval = "true" ]
					then
						  printf "\n$emp\t$first\t$lastn\t$sal"
						  
					fi
				done   
				printf "\n---------------------------------\n";;       
			7)	echo "Enter The Name of Employee (First Name) :"
			    	read fname

			    	echo "__________________________________________________"                       
			    	echo "                 Employee Details                       "
			    	echo "__________________________________________________"                       
			    	flag=0
			    	for j in `cat Employee.txt`
			    	do
					emp=$(echo "$j" | cut -d "," -f 1)
					first=$(echo "$j" | cut -d "," -f 2)
					lastn=$(echo "$j" | cut -d "," -f 3)
					ad=$(echo "$j" | cut -d "," -f 4)
					age=$(echo "$j" | cut -d "," -f 5)
					gndr=$(echo "$j" | cut -d "," -f 6)
					dept=$(echo "$j" | cut -d "," -f 7)
					sal=$(echo "$j" | cut -d "," -f 8)
					des=$(echo "$j" | cut -d "," -f 9)
					joining=$(echo "$j" | cut -d "," -f 10)
					tfval=$(echo "$j" | cut -d "," -f 11)
					                       
					if [ "$fname" = "$first" ] && [ $tfval = "true" ]
					then
					        flag=1
						echo "____________________________________________________________" 
						echo "  Emp_ID  		 :	 	         $emp        "             
						echo "  First_Name 	     	 : 		     	 $first "                    
						echo "  Last_Name		 : 		     	 $lastn"  
						echo "  Address                 :                      $ad   "
						echo "  Age                     :                      $age   "
						echo "  Gender                  :                      $gndr   "
						echo "  Department              :                      $dept"
						echo "  Salary                  :                      $sal   "
						echo "  Designation             :                      $des   "
						echo "  Joining_year            :                      $joining   "
						echo "____________________________________________________________"                         
					fi
			    done
			    if [ $flag = 0 ]
			    then
				 echo "               No Record Found              "
			    fi
			    echo "__________________________________________________";;
			8)	printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
				echo "          		                    Employee Details "
				printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
				printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\t\tAge\tGender\tDepartment\tSalary\tDesignation\tJoining_Date\n";
				printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
				rm alpha.txt
				touch alpha.txt
				for k in `cat Employee.txt`
				do
					name=$(echo "$k" | cut -d "," -f 2)
					echo $name >> alpha.txt
				done
				x=$(sort alpha.txt)
				echo $x > sorted.txt
				for i in `cat sorted.txt`
				do
					fname=$i
					for j in `cat Employee.txt`
					do
						emp=$(echo "$j" | cut -d "," -f 1)
						first=$(echo "$j" | cut -d "," -f 2)
						lastn=$(echo "$j" | cut -d "," -f 3)
						ad=$(echo "$j" | cut -d "," -f 4)
						age=$(echo "$j" | cut -d "," -f 5)
						gndr=$(echo "$j" | cut -d "," -f 6)
						dept=$(echo "$j" | cut -d "," -f 7)
						sal=$(echo "$j" | cut -d "," -f 8)
						des=$(echo "$j" | cut -d "," -f 9)
						joining=$(echo "$j" | cut -d "," -f 10)
						tfval=$(echo "$j" | cut -d "," -f 11)				                       
						if [ "$fname" = "$first" ] && [ $tfval = "true" ]
						then
							printf "$emp\t$first\t\t$lastn\t\t$ad  \t$age\t$gndr\t$dept  \t$sal\t$des\t$joining\t\t\n"
						fi
					done
				done
				printf "\n------------------------------------------------------------------------------------------------------------------------------\n" ;;
			9)	printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
				echo "          		                    Employee Details "
				printf "\n------------------------------------------------------------------------------------------------------------------------------\n"
				printf "Emp_ID\tFirst_Name\tLast_Name\tDepartment\t\tDesignation\t\tHour_Worked\tPay(In US Dollar)\n";
				printf "\n------------------------------------------------------------------------------------------------------------------------------\n"


				for j in `cat Employee.txt`
				do
					emp=$(echo "$j" | cut -d "," -f 1)
					first=$(echo "$j" | cut -d "," -f 2)
					lastn=$(echo "$j" | cut -d "," -f 3)
					dept=$(echo "$j" | cut -d "," -f 7)
					des=$(echo "$j" | cut -d "," -f 9)
					tfval=$(echo "$j" | cut -d "," -f 11)	
					hw=$(echo "$j" | cut -d "," -f 12)	
					pay=$(( $hw * 59 ))
					if [ $tfval = "true" ]
					then
						printf "$emp\t$first\t\t$lastn\t\t$dept\t\t $des\t\t $hw\t\t  $pay\n"
					fi
				done
				printf "\n------------------------------------------------------------------------------------------------------------------------------\n" ;;
			10)	return;;
			*)	echo "Invalid!";;

			esac
		done
}
Delete()
{
            f=0
            echo "Enter Employee ID: "
            read ID

            for j in `cat Employee.txt`
            do
                        emp=$(echo "$j" | cut -d "," -f 1)
                        first=$(echo "$j" | cut -d "," -f 2)
                        lastn=$(echo "$j" | cut -d "," -f 3)
                        ad=$(echo "$j" | cut -d "," -f 4)
                        age=$(echo "$j" | cut -d "," -f 5)
                        gndr=$(echo "$j" | cut -d "," -f 6)
                        dept=$(echo "$j" | cut -d "," -f 7)
                        sal=$(echo "$j" | cut -d "," -f 8)
                        des=$(echo "$j" | cut -d "," -f 9)
                        joining=$(echo "$j" | cut -d "," -f 10)
                        tfval=$(echo "$j" | cut -d "," -f 11)
                       
                        if [ $ID -eq $emp ]
                        then
                                    f=1                              
                                    line=$(echo "$emp,$first,$lastn,$ad,$age,$gndr,$dept,$sal,$des,$joining,false")
                                    fnm=`cat Employee.txt`
                                    d=$(echo "$fnm" | sed s/$j/$line/g )
                                    echo $d > Employee.txt          
                                    echo "                 Delete Successfully                           "
                        fi
            done
            if [ f = 0 ]
            then
                          echo "               No Record Found              "
            fi
}

Update()
{
            
            echo "Enter Employee ID: "
            read ID


                       
            for j in `cat Employee.txt`
            do
                        emp=$(echo "$j" | cut -d "," -f 1)
                        first=$(echo "$j" | cut -d "," -f 2)
                        lastn=$(echo "$j" | cut -d "," -f 3)
                        ad=$(echo "$j" | cut -d "," -f 4)
                        age=$(echo "$j" | cut -d "," -f 5)
                        gndr=$(echo "$j" | cut -d "," -f 6)
                        dept=$(echo "$j" | cut -d "," -f 7)
                        sal=$(echo "$j" | cut -d "," -f 8)
                        des=$(echo "$j" | cut -d "," -f 9)
                        joining=$(echo "$j" | cut -d "," -f 10)
                        tfval=$(echo "$j" | cut -d "," -f 11)
                       
                        if [ $ID -eq $emp ]
                        then
                                    printf "Fill in the following form : "
					printf "\nEmp_ID : "
					read emp
					printf "First_Name : "
					read first
					printf "Last_Name : "
					read lastn
					printf "Address : "
					read ad
					printf "Age : "
					read age
					printf "Gender : "
					read gndr
					printf "Department : "
					read dept
					printf "Salary : "
					read sal
					printf "Designation : "
					read des
					printf "Joining_year : "
					read joining
					line=$(echo "$emp,$first,$lastn,$ad,$age,$gndr,$dept,$sal,$des,$joining,true")
					fnm=`cat Employee.txt`
					d=$(echo "$fnm" | sed s/$j/$line/g )
					echo $d > Employee.txt          

					echo "    ****        Updated Sucessfully        ****"
					printf "\nRecord successfully added."; 
					printf "\nEnter any key to go back..."; 
					read a

                        fi
            done
}




while [ true ]
do
echo " *******************************"
echo " 1. Insert  "
echo " 2. Delete  "
echo " 3. Update  "
echo " 4. Display "
echo " 5. Specific Operations"
echo " 6. Search  "
echo " 7. Exit    "
echo " *******************************" 
echo "Enter Choice: "
read ch

case $ch in

            1)
               nxtSrNo=$(AutoNumber)
               Insert $nxtSrNo
               ;;
            2) Delete ;;
            3) Update ;;
            4) Display ;;
            5) SpecOper ;;
            6) Search ;;
            7) break;;
            *) echo " Wrong Choice "
esac
done
