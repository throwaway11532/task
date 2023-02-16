### Install and setup GAM

More info here: https://github.com/GAM-team/GAM/wiki#configure-gam

To install GAM, we can run the following script
```
bash <(curl -s -S -L https://gam-shortn.appspot.com/gam-install)
```


### Allow required Scopes to the account
```
$ gam oauth create

(...)

[*]  0) Chrome Browser Cloud Management (supports readonly)
[ ]  1) Chrome Management API - read only (2 scopes)
[ ]  2) Chrome Policy API
[ ]  3) Classroom API - counts as 5 scopes
[ ]  4) Cloud Identity - Groups (supports readonly)
[ ]  5) Cloud Identity - Inbound SSO Settings (supports readonly)
[ ]  6) Cloud Identity - OrgUnits (supports readonly)
[*]  7) Cloud Identity - User Invitations (supports readonly)
[ ]  8) Contact Delegation (supports readonly)
[ ]  9) Data Transfer API (supports readonly)
[ ] 10) Directory API - Chrome OS Devices (supports readonly)
[ ] 11) Directory API - Customers (supports readonly)
[ ] 12) Directory API - Domains (supports readonly)
[*] 13) Directory API - Groups (supports readonly)
[ ] 14) Directory API - Mobile Devices (supports readonly and action)
[ ] 15) Directory API - Printers (supports readonly)
[ ] 16) Directory API - Organizational Units (supports readonly)
[ ] 17) Directory API - Resource Calendars (supports readonly)
[ ] 18) Directory API - Roles (supports readonly)
[ ] 19) Directory API - User Schemas (supports readonly)
[ ] 20) Directory API - User Security
[*] 21) Directory API - Users (supports readonly)
[ ] 22) Group Settings API
[ ] 23) License Manager API
[ ] 24) Pub / Sub API
[ ] 25) Reports API - Audit Reports
[ ] 26) Reports API - Usage Reports
[ ] 27) Reseller API
[ ] 28) Site Verification API
[ ] 29) Vault Matters and Holds API (supports readonly)
[ ] 30) Cloud Storage - Vault/Takeout Download/Copy (supports readonly)
[*] 31) User Profile (Email address - read only) [required]
```


### Create an account for system@publitas.com and give it Superuser permission
```
gam create user superuser@rekic.me firstname Super lastname User password LkTGSBp5qnqS4RDK org / changepassword on gal off otheremail work system@publitas.com

gam create admin superuser@rekic.me _SEED_ADMIN_ROLE customer
```



### Run insert.sh script to bulk insert 8 users 

```
$ ./insert.sh 
Creating account for mscott@rekic.me
Creating account for jhaplert@rekic.me
Creating account for pbeesly@rekic.me
Creating account for dschrute@rekic.me
Creating account for amartin@rekic.me
Creating account for kmalone@rekic.me
Creating account for pvance@rekic.me
Creating account for shudson@rekic.me
```

### Create a group "operations"
```
$ gam create group operations@rekic.me name operations
```

### Add the CSV users to group, pass the group email to the script
```
$ ./group.sh operations@rekic.me
 Group: operations@rekic.me, jhaplert@rekic.me Added as MEMBER
 Group: operations@rekic.me, amartin@rekic.me Added as MEMBER
 Group: operations@rekic.me, pbeesly@rekic.me Added as MEMBER
 Group: operations@rekic.me, pvance@rekic.me Added as MEMBER
 Group: operations@rekic.me, dschrute@rekic.me Added as MEMBER
 Group: operations@rekic.me, kmalone@rekic.me Added as MEMBER
 Group: operations@rekic.me, mscott@rekic.me Added as MEMBER
 Group: operations@rekic.me, shudson@rekic.me Added as MEMBER
```


###Adding the shared drives 
save the drive ID, as you will need it for the later steps
```
$ gam user domagoj add shareddrive Internal
Created Shared Drive Internal with id 0AEoR-7KYXeP2Uk9PVA
$ gam user domagoj add shareddrive External
Created Shared Drive External with id 0AIouZkPxRsUhUk9PVA
```

### Adding the group access to the drives
```
$ gam user domagoj add drivefileacl 0AIouZkPxRsUhUk9PVA group operations@rekic.me  role writer
17189871830784640474
 id: 17189871830784640474
 type: group
 emailAddress: operations@rekic.me
 role: writer
 displayName: operations
 teamDrivePermissionDetails: [{'teamDrivePermissionType': 'member', 'role': 'writer', 'inherited': False}]
 permissionDetails: [{'permissionType': 'member', 'role': 'writer', 'inherited': False}]
 deleted: False

$ gam user domagoj add drivefileacl 0AEoR-7KYXeP2Uk9PVA group operations@rekic.me  role writer
17189871830784640474
 id: 17189871830784640474
 type: group
 emailAddress: operations@rekic.me
 role: writer
 displayName: operations
 teamDrivePermissionDetails: [{'teamDrivePermissionType': 'member', 'role': 'writer', 'inherited': False}]
 permissionDetails: [{'permissionType': 'member', 'role': 'writer', 'inherited': False}]
 deleted: False
```


### To prevent public file sharing from the "internal" drive, we can permit the access to domain-users only

```
$ gam user domagoj update teamdrive 0AEoR-7KYXeP2Uk9PVA domainusersonly true
Updated Shared Drive 0AEoR-7KYXeP2Uk9PVA
```










