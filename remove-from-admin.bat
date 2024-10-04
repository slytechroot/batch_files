net localgroup administrators ll.com\%username% /del
net localgroup users ll.com\02jsmith /del

wmic useraccount where "name='02jstmithadmin'" set passwordexpires=false


Username: .\02jstmith78admin
password: ResearchT3#



