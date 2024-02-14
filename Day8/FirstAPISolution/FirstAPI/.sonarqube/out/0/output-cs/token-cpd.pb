∑
|D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Contexts\RequestTarkerContext.cs
	namespace 	
FirstAPI
 
. 
Contexts 
{ 
public 

class  
RequestTarkerContext %
:& '
	DbContext' 0
{ 
public  
RequestTarkerContext #
(# $
DbContextOptions$ 4
options5 <
)< =
:= >
base> B
(B C
optionsC J
)J K
{		 	
} 	
public 
DbSet 
< 
Employee 
> 
	Employees (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DbSet 
< 

Departmnet 
>  
Departments! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
DbSet 
< 
User 
> 
Users  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 
Request 
> 
Requests &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
Request  '
>' (
(( )
)) *
. 
HasKey 
( 
r 
=> 
r 
. 
Id !
)! "
;" #
modelBuilder 
. 
Entity 
<  
Request  '
>' (
(( )
)) *
. 
HasOne 
( 
r 
=> 
r 
. 
Issuer %
)% &
. 
WithMany 
( 
r 
=> 
r 
. 
RaisedRequests -
)- .
. 
HasForeignKey 
( 
r  
=>! #
r$ %
.% &
	Issuer_Id& /
)/ 0
. 

IsRequired 
( 
) 
; 
modelBuilder 
. 
Entity 
<  
Request  '
>' (
(( )
)) *
. 
HasOne 
( 
r 
=> 
r 
. 
Resolver '
)' (
.   
WithMany   
(   
r   
=>   
r    
.    !
ResolvedRequests  ! 1
)  1 2
.!! 
HasForeignKey!! 
(!! 
r!!  
=>!!! #
r!!$ %
.!!% &
Resolver_Id!!& 1
)!!1 2
;!!2 3
modelBuilder$$ 
.$$ 
Entity$$ 
<$$  

Departmnet$$  *
>$$* +
($$+ ,
)$$, -
.$$- .
HasData$$. 5
($$5 6
new%% 

Departmnet%% 
{%%  
DeparmentNumber%%! 0
=%%0 1
$num%%1 2
,%%2 3
Name%%3 7
=%%7 8
$str%%8 <
}%%< =
,%%= >
new&& 

Departmnet&& 
{&&  
DeparmentNumber&&! 0
=&&1 2
$num&&3 4
,&&4 5
Name&&6 :
=&&; <
$str&&= D
}&&E F
)'' 
;'' 
}88 	
}99 
}:: ô!
}D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Controllers\EmployeeController.cs
	namespace

 	
FirstAPI


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
EmployeeController #
:$ %
ControllerBase& 4
{ 
private 
readonly !
IEmployeeAdminService .
_adminService/ <
;< =
public 
EmployeeController !
(! "!
IEmployeeAdminService" 7
adminService8 D
)D E
{F G
_adminService 
= 
adminService (
;( )
} 	
[ 
	Authorize 
] 
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
List 
< 
Employee '
>' (
>( )
GetEmployees* 6
(6 7
)7 8
{ 	
var 
	employees 
= 
await !
_adminService" /
./ 0 
GetEmployeeListAsync0 D
(D E
)E F
;F G
return 
	employees 
; 
} 	
[   	
	Authorize  	 
(   
Roles   
=   
$str   "
)  " #
]  # $
[!! 	
HttpGet!!	 
(!! 
$str!! 
)!! 
]!! 
public"" 
async"" 
Task"" 
<"" 
Employee"" "
>""" #
GetEmployees""$ 0
(""0 1
int""1 4
id""5 7
)""7 8
{## 	
var$$ 
employee$$ 
=$$ 
await$$  
_adminService$$! .
.$$. /
GetEmployee$$/ :
($$: ;
id$$; =
)$$= >
;$$> ?
return%% 
employee%% 
;%% 
}&& 	
[)) 	
HttpPost))	 
])) 
public++ 
async++ 
Task++ 
<++ 
Employee++ "
>++" #
Post++$ (
(++( )
Employee++) 1
employee++2 :
)++: ;
{,, 	
employee-- 
=-- 
await-- 
_adminService-- *
.--* +
AddEmployee--+ 6
(--6 7
employee--7 ?
)--? @
;--@ A
return.. 
employee.. 
;.. 
}// 	
[00 	
HttpPut00	 
]00 
public11 
async11 
Task11 
<11 
Employee11 "
>11" #
UpdateDepartment11$ 4
(114 5!
EmployeeDepartmentDTO115 J
employeeDto11K V
)11V W
{22 	
var33 
employee33 
=33 
await33  
_adminService33! .
.33. /)
ChangeEmployeeDepartmnetAsync33/ L
(33L M
employeeDto33M X
.33X Y
Id33Y [
,33[ \
employeeDto33] h
.33h i
DepartmentId33i u
)33u v
;33v w
return44 
employee44 
;44 
}55 	
[66 	
Route66	 
(66 
$str66 )
)66) *
]66* +
[77 	
HttpPut77	 
]77 
public88 
async88 
Task88 
<88 
Employee88 "
>88" #
UpdatePhone88$ /
(88/ 0
EmployeePhoneDTO880 @
employeeDto88A L
)88L M
{99 	
var:: 
employee:: 
=:: 
await::  
_adminService::! .
.::. /$
ChangeEmployeePhoneAsync::/ G
(::G H
employeeDto::H S
.::S T
Id::T V
,::V W
employeeDto::X c
.::c d
Phone::d i
)::i j
;::j k
return;; 
employee;; 
;;; 
}<< 	
}== 
}>> Œ	
{D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Controllers\SampleController.cs
	namespace 	
FirstAPI
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
SampleController !
:" #
ControllerBase$ 2
{		 
static

 
string

 
Name

 
=

 
string

 #
.

# $
Empty

$ )
;

) *
[ 	
HttpGet	 
] 
public 
string 
Get 
( 
) 
{ 	
return 
Name 
; 
} 	
[ 	
HttpPost	 
] 
public 
string 
Post 
( 
string !
	givenName" +
)+ ,
{ 	
Name 
= 
	givenName 
; 
return 
$str 
; 
} 	
} 
} Ñ
yD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Controllers\UserController.cs
	namespace 	
FirstAPI
 
. 
Controllers 
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
UserController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IUserService %
_userService& 2
;2 3
private 
readonly 
ILogger  
<  !
UserController! /
>/ 0
_logger1 8
;8 9
public 
UserController 
( 
IUserService *
userService+ 6
,6 7
ILogger7 >
<> ?
UserController? M
>M N
loggerO U
)U V
{ 	
_userService 
= 
userService &
;& '
_logger 
= 
logger 
; 
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
LoginUserDTO &
>& '
Register( 0
(0 1
RegisterUserDTO1 @
userA E
)E F
{ 	
var 
result 
= 
await 
_userService +
.+ ,
Register, 4
(4 5
user5 9
)9 :
;: ;
return 
result 
; 
} 	
[ 	
Route	 
( 
$str 
) 
] 
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
LoginUserDTO' 3
>3 4
>4 5
Login6 ;
(; <
LoginUserDTO< H
userI M
)M N
{   	
try!! 
{"" 
var## 
result## 
=## 
await## "
_userService### /
.##/ 0
Login##0 5
(##5 6
user##6 :
)##: ;
;##; <
return$$ 
Ok$$ 
($$ 
result$$  
)$$  !
;$$! "
}%% 
catch&& 
(&&  
InvlidUuserException&& '
iuse&&( ,
)&&, -
{'' 
_logger(( 
.(( 
LogCritical(( #
(((# $
iuse(($ (
.((( )
Message(() 0
)((0 1
;((1 2
return)) 
Unauthorized)) #
())# $
$str))$ B
)))B C
;))C D
}** 
},, 	
}-- 
}.. µ
ÑD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Controllers\WeatherForecastController.cs
	namespace 	
FirstAPI
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class %
WeatherForecastController *
:+ ,
ControllerBase- ;
{ 
private		 
static		 
readonly		 
string		  &
[		& '
]		' (
	Summaries		) 2
=		3 4
new		5 8
[		8 9
]		9 :
{

 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
)R S
{ 	
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
( 
Name 
= 
$str ,
), -
]- .
public 
IEnumerable 
< 
WeatherForecast *
>* +
Get, /
(/ 0
)0 1
{ 	
return 

Enumerable 
. 
Range #
(# $
$num$ %
,% &
$num' (
)( )
.) *
Select* 0
(0 1
index1 6
=>7 9
new: =
WeatherForecast> M
{ 
Date 
= 
DateTime 
.  
Now  #
.# $
AddDays$ +
(+ ,
index, 1
)1 2
,2 3
TemperatureC 
= 
Random %
.% &
Shared& ,
., -
Next- 1
(1 2
-2 3
$num3 5
,5 6
$num7 9
)9 :
,: ;
Summary 
= 
	Summaries #
[# $
Random$ *
.* +
Shared+ 1
.1 2
Next2 6
(6 7
	Summaries7 @
.@ A
LengthA G
)G H
]H I
} 
) 
. 
ToArray 
( 
) 
; 
} 	
}   
}!! ©
~D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Exceptions\InvlidUuserException.cs
	namespace 	
FirstAPI
 
. 

Exceptions 
{ 
[ 
Serializable 
] 
internal 
class  
InvlidUuserException '
:( )
	Exception* 3
{ 
string 
message 
; 
public		  
InvlidUuserException		 #
(		# $
)		$ %
{

 	
message 
= 
$str 4
;4 5
} 	
public 
override 
string 
Message &
=>' )
message* 1
;1 2
} 
} ì
ÇD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Exceptions\NoRequestRaisedException.cs
	namespace 	
FirstAPI
 
. 

Exceptions 
{ 
[ 
Serializable 
] 
internal 
class $
NoRequestRaisedException +
:, -
	Exception. 7
{ 
public $
NoRequestRaisedException '
(' (
)( )
{		 	
}

 	
public $
NoRequestRaisedException '
(' (
string( .
?. /
message0 7
)7 8
:9 :
base; ?
(? @
message@ G
)G H
{ 	
} 	
public $
NoRequestRaisedException '
(' (
string( .
?. /
message0 7
,7 8
	Exception9 B
?B C
innerExceptionD R
)R S
:T U
baseV Z
(Z [
message[ b
,b c
innerExceptiond r
)r s
{ 	
} 	
	protected $
NoRequestRaisedException *
(* +
SerializationInfo+ <
info= A
,A B
StreamingContextC S
contextT [
)[ \
:] ^
base_ c
(c d
infod h
,h i
contextj q
)q r
{ 	
} 	
} 
} ˘
ÅD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Exceptions\NoSuchEmployeeException.cs
	namespace 	
FirstAPI
 
. 

Exceptions 
{ 
public 

class #
NoSuchEmployeeException (
:) *
	Exception* 3
{ 
string 
message 
; 
public #
NoSuchEmployeeException &
(& '
)' (
{ 	
message 
= 
$str 5
;5 6
}		 	
public

 
override

 
string

 
Message

 &
=>

' )
message

* 1
;

1 2
} 
} á
ÄD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Exceptions\NoSuchRequestException.cs
	namespace 	
FirstAPI
 
. 

Exceptions 
{ 
[ 
Serializable 
] 
internal 
class "
NoSuchRequestException )
:* +
	Exception, 5
{ 
public "
NoSuchRequestException %
(% &
)& '
{		 	
}

 	
public "
NoSuchRequestException %
(% &
string& ,
?, -
message. 5
)5 6
:7 8
base9 =
(= >
message> E
)E F
{ 	
} 	
public "
NoSuchRequestException %
(% &
string& ,
?, -
message. 5
,5 6
	Exception7 @
?@ A
innerExceptionB P
)P Q
:R S
baseT X
(X Y
messageY `
,` a
innerExceptionb p
)p q
{ 	
} 	
	protected "
NoSuchRequestException (
(( )
SerializationInfo) :
info; ?
,? @
StreamingContextA Q
contextR Y
)Y Z
:[ \
base] a
(a b
infob f
,f g
contexth o
)o p
{ 	
} 	
} 
} ¿

D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Interfaces\IEmployeeAdminService.cs
	namespace 	
FirstAPI
 
. 

Interfaces 
{ 
public 

	interface !
IEmployeeAdminService *
:* + 
IEmployeeUserService+ ?
{ 
public 
Task 
< 
List 
< 
Employee !
>! "
>" # 
GetEmployeeListAsync$ 8
(8 9
)9 :
;: ;
public		 
Task		 
<		 
Employee		 
>		 
AddEmployee		 )
(		) *
Employee		* 2
employee		3 ;
)		; <
;		< =
public

 
Task

 
<

 
Employee

 
>

 $
ChangeEmployeePhoneAsync

 6
(

6 7
int

7 :
id

; =
,

= >
string

? E
phone

F K
)

K L
;

L M
public 
Task 
< 
Employee 
> )
ChangeEmployeeDepartmnetAsync ;
(; <
int< ?
id@ B
,B C
intD G
departmnetIdH T
)T U
;U V
} 
} ò
~D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Interfaces\IEmployeeUserService.cs
	namespace 	
FirstAPI
 
. 

Interfaces 
{ 
public 

	interface  
IEmployeeUserService )
{ 
public 
Task 
< 
Employee 
> 
GetEmployee )
() *
int* -
id. 0
)0 1
;1 2
} 
}		 ß

uD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Interfaces\IRepository.cs
	namespace 	
FirstAPI
 
. 

Interfaces 
{ 
public 

	interface 
IRepository  
<  !
K! "
," #
T# $
>$ %
{ 
public 
Task 
< 
T 
> 
GetAsync 
(  
K  !
key" %
)% &
;& '
public 
Task 
< 
List 
< 
T 
> 
> 
GetAsync %
(% &
)& '
;' (
public 
Task 
< 
T 
> 
Add 
( 
T 
item !
)! "
;" #
public 
Task 
< 
T 
> 
Update 
( 
T 
item  $
)$ %
;% &
public		 
Task		 
<		 
T		 
>		 
Delete		 
(		 
K		 
key		  #
)		# $
;		$ %
}

 
} µ	
ÅD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Interfaces\IRequestEmployeeService.cs
	namespace 	
FirstAPI
 
. 

Interfaces 
{ 
public 

	interface #
IRequestEmployeeService ,
{ 
public 
Task 
< 
Request 
> 
CreateRequest *
(* +
Request+ 2
request3 :
): ;
;; <
public 
Task 
< 
IList 
< 
Request !
>! "
>" ##
GetAllResuestByEmployee$ ;
(; <
int< ?

employeeId@ J
)J K
;K L
public		 
Task		 
<		 
Request		 
>		 
GetRequestStatus		 -
(		- .
int		. 1
id		2 4
)		4 5
;		5 6
public

 
Task

 
<

 
Request

 
>

 
DeleteRequest

 *
(

* +
int

+ .
id

/ 1
)

1 2
;

2 3
} 
} ï
wD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Interfaces\ITokenService.cs
	namespace 	
FirstAPI
 
. 

Interfaces 
{ 
public 

	interface 
ITokenService "
{ 
public 
Task 
< 
string 
> 
GenerateToken )
() *
LoginUserDTO* 6
user7 ;
); <
;< =
} 
}		 ·
vD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Interfaces\IUserService.cs
	namespace 	
FirstAPI
 
. 

Interfaces 
{ 
public 

	interface 
IUserService !
{ 
public 
Task 
< 
LoginUserDTO  
>  !
Login" '
(' (
LoginUserDTO( 4
user5 9
)9 :
;: ;
public		 
Task		 
<		 
LoginUserDTO		  
>		  !
Register		" *
(		* +
RegisterUserDTO		+ :
user		; ?
)		? @
;		@ A
}

 
} ‘
yD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Mappers\RegisterToEmployee.cs
	namespace 	
FirstAPI
 
. 
Mappers 
{ 
public 

class 
RegisterToEmployee #
{ 
Employee 
employee 
; 
public		 
RegisterToEmployee		 !
(		! "
RegisterUserDTO		" 1
register		2 :
)		: ;
{

 	
employee 
= 
new 
Employee #
(# $
)$ %
;% &
employee 
. 
Name 
= 
register $
.$ %
Name% )
;) *
employee 
. 
Email 
= 
register %
.% &
Email& +
;+ ,
employee 
. 
Phone 
= 
register %
.% &
Phone& +
;+ ,
employee 
. 
DateOfBirth  
=! "
register# +
.+ ,
DateOfBirth, 7
;7 8
employee 
. 
Pic 
= 
register $
.$ %
Pic% (
;( )
employee 
. 
DepartmentId !
=" #
register$ ,
., -
DepartmentId- 9
;9 :
employee 
. 
Username 
= 
register  (
.( )
Username) 1
;1 2
} 	
public 
Employee 
GetEmployee #
(# $
)$ %
{ 	
return 
employee 
; 
} 	
} 
} ®
uD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Mappers\RegisterToUser.cs
	namespace 	
FirstAPI
 
. 
Mappers 
{ 
public		 

class		 
RegisterToUser		 
{

 
User 
user 
; 
public 
RegisterToUser 
( 
RegisterUserDTO -
register. 6
)6 7
{ 	
user 
= 
new 
User 
( 
) 
; 
user 
. 
Username 
= 
register $
.$ %
Username% -
;- .
user 
. 
Role 
= 
register  
.  !
Role! %
;% &
GetPassword 
( 
register  
.  !
Password! )
)) *
;* +
} 	
void 
GetPassword 
( 
string 
password  (
)( )
{ 	

HMACSHA512 
hmac 
= 
new  

HMACSHA512! +
(+ ,
), -
;- .
user 
. 
Key 
= 
hmac 
. 
Key 
;  
user 
. 
Password 
= 
hmac  
.  !
ComputeHash! ,
(, -
Encoding- 5
.5 6
UTF86 :
.: ;
GetBytes; C
(C D
passwordD L
)L M
)M N
;N O
} 	
public 
User 
GetUser 
( 
) 
{ 	
return 
user 
; 
} 	
} 
} ö|
ÖD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Migrations\20240205041301_RequestBasic.cs
	namespace 	
FirstAPI
 
. 

Migrations 
{ 
public 

partial 
class 
RequestBasic %
:& '
	Migration( 1
{		 
	protected

 
override

 
void

 
Up

  "
(

" #
MigrationBuilder

# 3
migrationBuilder

4 D
)

D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
DeparmentNumber #
=$ %
table& +
.+ ,
Column, 2
<2 3
int3 6
>6 7
(7 8
type8 <
:< =
$str> C
,C D
nullableE M
:M N
falseO T
)T U
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
nullableG O
:O P
falseQ V
)V W
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
DeparmentNumber> M
)M N
;N O
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
Username 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
nullableK S
:S T
falseU Z
)Z [
,[ \
Password 
= 
table $
.$ %
Column% +
<+ ,
byte, 0
[0 1
]1 2
>2 3
(3 4
type4 8
:8 9
$str: J
,J K
nullableL T
:T U
falseV [
)[ \
,\ ]
Role 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
Key   
=   
table   
.    
Column    &
<  & '
byte  ' +
[  + ,
]  , -
>  - .
(  . /
type  / 3
:  3 4
$str  5 E
,  E F
nullable  G O
:  O P
false  Q V
)  V W
}!! 
,!! 
constraints"" 
:"" 
table"" "
=>""# %
{## 
table$$ 
.$$ 

PrimaryKey$$ $
($$$ %
$str$$% /
,$$/ 0
x$$1 2
=>$$3 5
x$$6 7
.$$7 8
Username$$8 @
)$$@ A
;$$A B
}%% 
)%% 
;%% 
migrationBuilder'' 
.'' 
CreateTable'' (
(''( )
name(( 
:(( 
$str(( !
,((! "
columns)) 
:)) 
table)) 
=>)) !
new))" %
{** 
Id++ 
=++ 
table++ 
.++ 
Column++ %
<++% &
int++& )
>++) *
(++* +
type+++ /
:++/ 0
$str++1 6
,++6 7
nullable++8 @
:++@ A
false++B G
)++G H
.,, 

Annotation,, #
(,,# $
$str,,$ 8
,,,8 9
$str,,: @
),,@ A
,,,A B
Name-- 
=-- 
table--  
.--  !
Column--! '
<--' (
string--( .
>--. /
(--/ 0
type--0 4
:--4 5
$str--6 E
,--E F
nullable--G O
:--O P
false--Q V
)--V W
,--W X
Email.. 
=.. 
table.. !
...! "
Column.." (
<..( )
string..) /
>../ 0
(..0 1
type..1 5
:..5 6
$str..7 F
,..F G
nullable..H P
:..P Q
false..R W
)..W X
,..X Y
Phone// 
=// 
table// !
.//! "
Column//" (
<//( )
string//) /
>/// 0
(//0 1
type//1 5
://5 6
$str//7 F
,//F G
nullable//H P
://P Q
false//R W
)//W X
,//X Y
Pic00 
=00 
table00 
.00  
Column00  &
<00& '
string00' -
>00- .
(00. /
type00/ 3
:003 4
$str005 D
,00D E
nullable00F N
:00N O
true00P T
)00T U
,00U V
DateOfBirth11 
=11  !
table11" '
.11' (
Column11( .
<11. /
DateTime11/ 7
>117 8
(118 9
type119 =
:11= >
$str11? J
,11J K
nullable11L T
:11T U
false11V [
)11[ \
,11\ ]
Username22 
=22 
table22 $
.22$ %
Column22% +
<22+ ,
string22, 2
>222 3
(223 4
type224 8
:228 9
$str22: I
,22I J
nullable22K S
:22S T
false22U Z
)22Z [
,22[ \
DepartmentId33  
=33! "
table33# (
.33( )
Column33) /
<33/ 0
int330 3
>333 4
(334 5
type335 9
:339 :
$str33; @
,33@ A
nullable33B J
:33J K
true33L P
)33P Q
}44 
,44 
constraints55 
:55 
table55 "
=>55# %
{66 
table77 
.77 

PrimaryKey77 $
(77$ %
$str77% 3
,773 4
x775 6
=>777 9
x77: ;
.77; <
Id77< >
)77> ?
;77? @
table88 
.88 

ForeignKey88 $
(88$ %
name99 
:99 
$str99 E
,99E F
column:: 
::: 
x::  !
=>::" $
x::% &
.::& '
DepartmentId::' 3
,::3 4
principalTable;; &
:;;& '
$str;;( 5
,;;5 6
principalColumn<< '
:<<' (
$str<<) :
)<<: ;
;<<; <
table== 
.== 

ForeignKey== $
(==$ %
name>> 
:>> 
$str>> ;
,>>; <
column?? 
:?? 
x??  !
=>??" $
x??% &
.??& '
Username??' /
,??/ 0
principalTable@@ &
:@@& '
$str@@( /
,@@/ 0
principalColumnAA '
:AA' (
$strAA) 3
,AA3 4
onDeleteBB  
:BB  !
ReferentialActionBB" 3
.BB3 4
CascadeBB4 ;
)BB; <
;BB< =
}CC 
)CC 
;CC 
migrationBuilderEE 
.EE 
CreateTableEE (
(EE( )
nameFF 
:FF 
$strFF  
,FF  !
columnsGG 
:GG 
tableGG 
=>GG !
newGG" %
{HH 
IdII 
=II 
tableII 
.II 
ColumnII %
<II% &
intII& )
>II) *
(II* +
typeII+ /
:II/ 0
$strII1 6
,II6 7
nullableII8 @
:II@ A
falseIIB G
)IIG H
.JJ 

AnnotationJJ #
(JJ# $
$strJJ$ 8
,JJ8 9
$strJJ: @
)JJ@ A
,JJA B
RequestTextKK 
=KK  !
tableKK" '
.KK' (
ColumnKK( .
<KK. /
stringKK/ 5
>KK5 6
(KK6 7
typeKK7 ;
:KK; <
$strKK= L
,KKL M
nullableKKN V
:KKV W
falseKKX ]
)KK] ^
,KK^ _
RequestTypeLL 
=LL  !
tableLL" '
.LL' (
ColumnLL( .
<LL. /
stringLL/ 5
>LL5 6
(LL6 7
typeLL7 ;
:LL; <
$strLL= L
,LLL M
nullableLLN V
:LLV W
falseLLX ]
)LL] ^
,LL^ _
StatusMM 
=MM 
tableMM "
.MM" #
ColumnMM# )
<MM) *
stringMM* 0
>MM0 1
(MM1 2
typeMM2 6
:MM6 7
$strMM8 G
,MMG H
nullableMMI Q
:MMQ R
trueMMS W
)MMW X
,MMX Y

RaisedDateNN 
=NN  
tableNN! &
.NN& '
ColumnNN' -
<NN- .
DateTimeNN. 6
>NN6 7
(NN7 8
typeNN8 <
:NN< =
$strNN> I
,NNI J
nullableNNK S
:NNS T
trueNNU Y
)NNY Z
,NNZ [
LastUpdatedDteOO "
=OO# $
tableOO% *
.OO* +
ColumnOO+ 1
<OO1 2
DateTimeOO2 :
>OO: ;
(OO; <
typeOO< @
:OO@ A
$strOOB M
,OOM N
nullableOOO W
:OOW X
trueOOY ]
)OO] ^
,OO^ _
ResolvedDatePP  
=PP! "
tablePP# (
.PP( )
ColumnPP) /
<PP/ 0
DateTimePP0 8
>PP8 9
(PP9 :
typePP: >
:PP> ?
$strPP@ K
,PPK L
nullablePPM U
:PPU V
truePPW [
)PP[ \
,PP\ ]
	Issuer_IdQQ 
=QQ 
tableQQ  %
.QQ% &
ColumnQQ& ,
<QQ, -
intQQ- 0
>QQ0 1
(QQ1 2
typeQQ2 6
:QQ6 7
$strQQ8 =
,QQ= >
nullableQQ? G
:QQG H
falseQQI N
)QQN O
,QQO P
Resolver_IdRR 
=RR  !
tableRR" '
.RR' (
ColumnRR( .
<RR. /
intRR/ 2
>RR2 3
(RR3 4
typeRR4 8
:RR8 9
$strRR: ?
,RR? @
nullableRRA I
:RRI J
trueRRK O
)RRO P
}SS 
,SS 
constraintsTT 
:TT 
tableTT "
=>TT# %
{UU 
tableVV 
.VV 

PrimaryKeyVV $
(VV$ %
$strVV% 2
,VV2 3
xVV4 5
=>VV6 8
xVV9 :
.VV: ;
IdVV; =
)VV= >
;VV> ?
tableWW 
.WW 

ForeignKeyWW $
(WW$ %
nameXX 
:XX 
$strXX ?
,XX? @
columnYY 
:YY 
xYY  !
=>YY" $
xYY% &
.YY& '
	Issuer_IdYY' 0
,YY0 1
principalTableZZ &
:ZZ& '
$strZZ( 3
,ZZ3 4
principalColumn[[ '
:[[' (
$str[[) -
,[[- .
onDelete\\  
:\\  !
ReferentialAction\\" 3
.\\3 4
Cascade\\4 ;
)\\; <
;\\< =
table]] 
.]] 

ForeignKey]] $
(]]$ %
name^^ 
:^^ 
$str^^ A
,^^A B
column__ 
:__ 
x__  !
=>__" $
x__% &
.__& '
Resolver_Id__' 2
,__2 3
principalTable`` &
:``& '
$str``( 3
,``3 4
principalColumnaa '
:aa' (
$straa) -
)aa- .
;aa. /
}bb 
)bb 
;bb 
migrationBuilderdd 
.dd 

InsertDatadd '
(dd' (
tableee 
:ee 
$stree $
,ee$ %
columnsff 
:ff 
newff 
[ff 
]ff 
{ff  
$strff! 2
,ff2 3
$strff4 :
}ff; <
,ff< =
valuesgg 
:gg 
newgg 
objectgg "
[gg" #
]gg# $
{gg% &
$numgg' (
,gg( )
$strgg* .
}gg/ 0
)gg0 1
;gg1 2
migrationBuilderii 
.ii 

InsertDataii '
(ii' (
tablejj 
:jj 
$strjj $
,jj$ %
columnskk 
:kk 
newkk 
[kk 
]kk 
{kk  
$strkk! 2
,kk2 3
$strkk4 :
}kk; <
,kk< =
valuesll 
:ll 
newll 
objectll "
[ll" #
]ll# $
{ll% &
$numll' (
,ll( )
$strll* 1
}ll2 3
)ll3 4
;ll4 5
migrationBuildernn 
.nn 
CreateIndexnn (
(nn( )
nameoo 
:oo 
$stroo 1
,oo1 2
tablepp 
:pp 
$strpp "
,pp" #
columnqq 
:qq 
$strqq &
)qq& '
;qq' (
migrationBuilderss 
.ss 
CreateIndexss (
(ss( )
namett 
:tt 
$strtt -
,tt- .
tableuu 
:uu 
$struu "
,uu" #
columnvv 
:vv 
$strvv "
,vv" #
uniqueww 
:ww 
trueww 
)ww 
;ww 
migrationBuilderyy 
.yy 
CreateIndexyy (
(yy( )
namezz 
:zz 
$strzz -
,zz- .
table{{ 
:{{ 
$str{{ !
,{{! "
column|| 
:|| 
$str|| #
)||# $
;||$ %
migrationBuilder~~ 
.~~ 
CreateIndex~~ (
(~~( )
name 
: 
$str /
,/ 0
table
ÄÄ 
:
ÄÄ 
$str
ÄÄ !
,
ÄÄ! "
column
ÅÅ 
:
ÅÅ 
$str
ÅÅ %
)
ÅÅ% &
;
ÅÅ& '
}
ÇÇ 	
	protected
ÑÑ 
override
ÑÑ 
void
ÑÑ 
Down
ÑÑ  $
(
ÑÑ$ %
MigrationBuilder
ÑÑ% 5
migrationBuilder
ÑÑ6 F
)
ÑÑF G
{
ÖÖ 	
migrationBuilder
ÜÜ 
.
ÜÜ 
	DropTable
ÜÜ &
(
ÜÜ& '
name
áá 
:
áá 
$str
áá  
)
áá  !
;
áá! "
migrationBuilder
ââ 
.
ââ 
	DropTable
ââ &
(
ââ& '
name
ää 
:
ää 
$str
ää !
)
ää! "
;
ää" #
migrationBuilder
åå 
.
åå 
	DropTable
åå &
(
åå& '
name
çç 
:
çç 
$str
çç #
)
çç# $
;
çç$ %
migrationBuilder
èè 
.
èè 
	DropTable
èè &
(
èè& '
name
êê 
:
êê 
$str
êê 
)
êê 
;
êê 
}
ëë 	
}
íí 
}ìì É
pD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Models\Departmnet.cs
	namespace 	
FirstAPI
 
. 
Models 
{ 
public 

class 

Departmnet 
{ 
[ 	
Key	 
] 
public		 
int		 
DeparmentNumber		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
ICollection 
< 
Employee "
>" #
?# $
	Employees% .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} §
ÄD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Models\DTOs\EmployeeDepartmentDTO.cs
	namespace 	
FirstAPI
 
. 
Models 
. 
DTOs 
{ 
public 

class !
EmployeeDepartmentDTO &
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
DepartmentId 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ï
{D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Models\DTOs\EmployeePhoneDTO.cs
	namespace 	
FirstAPI
 
. 
Models 
. 
DTOs 
{ 
public 

class 
EmployeePhoneDTO !
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
} 
}  
wD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Models\DTOs\LoginUserDTO.cs
	namespace 	
FirstAPI
 
. 
Models 
. 
DTOs 
{ 
public 

class 
LoginUserDTO 
{		 
public

 
string

 
Username

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
} 
} 
zD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Models\DTOs\RegisterUserDTO.cs
	namespace 	
FirstAPI
 
. 
Models 
. 
DTOs 
{ 
public 

class 
RegisterUserDTO  
{		 
public

 
string

 
Username

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
? 
Pic 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
DateOfBirth #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
? 
DepartmentId  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} À(
nD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Models\Employee.cs
	namespace 	
FirstAPI
 
. 
Models 
{ 
public 

class 
Employee 
: 

IEquatable &
<& '
Employee' /
>/ 0
{ 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
? 
Pic 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
DateOfBirth #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
? 
DepartmentId  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	

ForeignKey	 
( 
$str "
)" #
]# $
public 

Departmnet 
? 

Department %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	

ForeignKey	 
( 
$str 
) 
]  
public 
User 
? 
User 
{ 
get 
;  
set! $
;$ %
}& '
public 
ICollection 
< 
Request "
>" #
?# $
RaisedRequests% 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
ICollection 
< 
Request "
>" #
?# $
ResolvedRequests% 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
Employee 
( 
) 
{ 	
Id 
= 
$num 
; 
} 	
public 
Employee 
( 
int 
id 
, 
string  &
name' +
,+ ,
string- 3
email4 9
,9 :
string; A
phoneB G
,G H
stringI O
?O P
picQ T
,T U
DateTimeV ^
dateOfBirth_ j
)j k
{   	
Id!! 
=!! 
id!! 
;!! 
Name"" 
="" 
name"" 
;"" 
Email## 
=## 
email## 
;## 
Phone$$ 
=$$ 
phone$$ 
;$$ 
Pic%% 
=%% 
pic%% 
;%% 
DateOfBirth&& 
=&& 
dateOfBirth&& %
;&&% &
}'' 	
public)) 
Employee)) 
()) 
string)) 
name)) #
,))# $
string))% +
email)), 1
,))1 2
string))3 9
phone)): ?
,))? @
string))A G
?))G H
pic))I L
,))L M
DateTime))N V
dateOfBirth))W b
)))b c
{** 	
Name++ 
=++ 
name++ 
;++ 
Email,, 
=,, 
email,, 
;,, 
Phone-- 
=-- 
phone-- 
;-- 
Pic.. 
=.. 
pic.. 
;.. 
DateOfBirth// 
=// 
dateOfBirth// %
;//% &
}00 	
public22 
bool22 
Equals22 
(22 
Employee22 #
?22# $
other22% *
)22* +
{33 	
var44 
employee44 
=44 
other44  
??44! #
new44# &
Employee44' /
(44/ 0
)440 1
;441 2
return55 
this55 
.55 
Id55 
.55 
Equals55 !
(55! "
employee55" *
.55* +
Id55+ -
)55- .
;55. /
}66 	
}88 
}99 Ó
mD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Models\Request.cs
	namespace 	
FirstAPI
 
. 
Models 
{ 
public 

class 
Request 
{ 
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
[

 	
Required

	 
(

 
ErrorMessage

 
=

  
$str

  Z
)

Z [
]

[ \
public 
string 
RequestText !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
RequestType !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
? 
Status 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
$str. 7
;7 8
public 
DateTime 
? 

RaisedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
=2 3
DateTime4 <
.< =
Today= B
;B C
public 
DateTime 
? 
LastUpdatedDte '
{( )
get* -
;- .
set/ 2
;2 3
}3 4
public 
DateTime 
? 
ResolvedDate %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
	Issuer_Id 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
? 
Resolver_Id 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Employee 
? 
Issuer 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Employee 
? 
Resolver !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ó	
jD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Models\User.cs
	namespace 	
FirstAPI
 
. 
Models 
{ 
public		 

class		 
User		 
{

 
[ 	
Key	 
] 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
byte 
[ 
] 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
public 
byte 
[ 
] 
Key 
{ 
get 
;  
set! $
;$ %
}& '
public 
Employee 
Employee  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} Û
qD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\OLdWays\DataAccess.cs
	namespace 	
FirstAPI
 
. 
OLdWays 
{ 
public 

class 

DataAccess 
{ 
SqlDataAdapter		 
dataAdapter		 "
;		" #
SqlConnection

 
conn

 
;

 
public 

DataAccess 
( 
) 
{ 	
conn 
= 
new 
SqlConnection $
($ %
$str	% í
)
í ì
;
ì î
dataAdapter 
= 
new 
SqlDataAdapter ,
(, -
$str- F
,F G
connH L
)L M
;M N
} 	
public 
List 
< 
Employee 
> 
GetEmployees *
(* +
)+ ,
{ 	
List 
< 
Employee 
> 
	employees $
=% &
new' *
List+ /
</ 0
Employee0 8
>8 9
(9 :
): ;
;; <
DataSet 
dataSet 
= 
new !
DataSet" )
() *
)* +
;+ ,
dataAdapter 
. 
Fill 
( 
dataSet $
)$ %
;% &
foreach 
( 
DataRow 
item !
in" $
dataSet% ,
., -
Tables- 3
[3 4
$num4 5
]5 6
.6 7
Rows7 ;
); <
{ 
Employee 
employee !
=" #
new$ '
Employee( 0
(0 1
)1 2
;2 3
employee 
. 
Id 
= 
Convert %
.% &
ToInt32& -
(- .
item. 2
[2 3
$num3 4
]4 5
.5 6
ToString6 >
(> ?
)? @
)@ A
;A B
employee 
. 
Name 
= 
item  $
[$ %
$num% &
]& '
.' (
ToString( 0
(0 1
)1 2
;2 3
employee 
. 
Email 
=  
item! %
[% &
$num& '
]' (
.( )
ToString) 1
(1 2
)2 3
;3 4
employee 
. 
Phone 
=  
item! %
[% &
$num& '
]' (
.( )
ToString) 1
(1 2
)2 3
;3 4
employee 
. 
Pic 
= 
item #
[# $
$num$ %
]% &
.& '
ToString' /
(/ 0
)0 1
;1 2
employee 
. 
DateOfBirth $
=% &
Convert' .
.. /

ToDateTime/ 9
(9 :
item: >
[> ?
$num? @
]@ A
)A B
;B C
	employees 
. 
Add 
( 
employee &
)& '
;' (
}   
return!! 
	employees!! 
;!! 
}"" 	
}## 
}$$ È@
fD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Program.cs
	namespace 	
FirstAPI
 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
var 
builder 
= 
WebApplication (
.( )
CreateBuilder) 6
(6 7
args7 ;
); <
;< =
builder 
. 
Services 
. 
AddControllers +
(+ ,
), -
.- .
AddJsonOptions. <
(< =
opts= A
=>B D
{ 
opts 
. !
JsonSerializerOptions *
.* +
ReferenceHandler+ ;
=< =
ReferenceHandler> N
.N O
IgnoreCyclesO [
;[ \
opts 
. !
JsonSerializerOptions *
.* +
WriteIndented+ 8
=9 :
true; ?
;? @
} 
) 
; 
builder 
. 
Services 
. #
AddEndpointsApiExplorer 4
(4 5
)5 6
;6 7
builder 
. 
Services 
. 
AddSwaggerGen *
(* +
opt+ .
=>/ 1
{ 
opt   
.   

SwaggerDoc   "
(  " #
$str  # '
,  ' (
new  ) ,
OpenApiInfo  - 8
{  9 :
Title  ; @
=  A B
$str  C J
,  J K
Version  L S
=  T U
$str  V Z
}  [ \
)  \ ]
;  ] ^
opt!! 
.!! !
AddSecurityDefinition!! -
(!!- .
$str!!. 6
,!!6 7
new!!8 ;!
OpenApiSecurityScheme!!< Q
{"" 
In## 
=## 
ParameterLocation## .
.##. /
Header##/ 5
,##5 6
Description$$ #
=$$$ %
$str$$& :
,$$: ;
Name%% 
=%% 
$str%% .
,%%. /
Type&& 
=&& 
SecuritySchemeType&& 1
.&&1 2
Http&&2 6
,&&6 7
BearerFormat'' $
=''% &
$str''' ,
,'', -
Scheme(( 
=((  
$str((! )
})) 
))) 
;)) 
opt++ 
.++ "
AddSecurityRequirement++ .
(++. /
new++/ 2&
OpenApiSecurityRequirement++3 M
{,, 
{-- 
new.. !
OpenApiSecurityScheme..  5
{// 
	Reference00  )
=00* +
new00, /
OpenApiReference000 @
{11  !
Type22$ (
=22( )
ReferenceType22) 6
.226 7
SecurityScheme227 E
,22E F
Id33$ &
=33& '
$str33' /
}44  !
}55 
,55 
new66 
string66  &
[66& '
]66' (
{66( )
}66) *
}77 
}88 
)88 
;88 
}99 
)99 
;99 
builder:: 
.:: 
Services:: 
.:: 
AddAuthentication:: .
(::. /
JwtBearerDefaults::/ @
.::@ A 
AuthenticationScheme::A U
)::U V
.;; 
AddJwtBearer;; 
(;; 
options;; %
=>;;& (
{<< 
options== 
.== %
TokenValidationParameters== 5
===6 7
new==8 ;%
TokenValidationParameters==< U
{>> $
ValidateIssuerSigningKey?? 0
=??1 2
true??3 7
,??7 8
IssuerSigningKey@@ (
=@@) *
new@@+ . 
SymmetricSecurityKey@@/ C
(@@C D
Encoding@@D L
.@@L M
UTF8@@M Q
.@@Q R
GetBytes@@R Z
(@@Z [
builder@@[ b
.@@b c
Configuration@@c p
[@@p q
$str@@q |
]@@| }
)@@} ~
)@@~ 
,	@@ Ä
ValidateIssuerAA &
=AA' (
falseAA) .
,AA. /
ValidateAudienceBB (
=BB) *
falseBB+ 0
}CC 
;CC 
}DD 
)DD 
;DD 
builderGG 
.GG 
ServicesGG 
.GG 
AddDbContextGG )
<GG) * 
RequestTarkerContextGG* >
>GG> ?
(GG? @
optsGG@ D
=>GGE G
{HH 
optsII 
.II 
UseSqlServerII !
(II! "
builderII" )
.II) *
ConfigurationII* 7
.II7 8
GetConnectionStringII8 K
(IIK L
$strIIL f
)IIf g
)IIg h
;IIh i
}JJ 
)JJ 
;JJ 
builderNN 
.NN 
ServicesNN 
.NN 
	AddScopedNN &
<NN& '
IRepositoryNN' 2
<NN2 3
intNN3 6
,NN6 7
EmployeeNN7 ?
>NN? @
,NN@ A
EmployeeRepositoryNNA S
>NNS T
(NNT U
)NNU V
;NNV W
builderOO 
.OO 
ServicesOO 
.OO 
	AddScopedOO &
<OO& '
IRepositoryOO' 2
<OO2 3
intOO3 6
,OO6 7
RequestOO7 >
>OO> ?
,OO? @
RequestRepositoryOO@ Q
>OOQ R
(OOR S
)OOS T
;OOT U
builderPP 
.PP 
ServicesPP 
.PP 
	AddScopedPP &
<PP& '
IRepositoryPP' 2
<PP2 3
stringPP3 9
,PP9 :
UserPP; ?
>PP? @
,PP@ A
UserRepositoryPPB P
>PPP Q
(PPQ R
)PPR S
;PPS T
builderUU 
.UU 
ServicesUU 
.UU 
	AddScopedUU &
<UU& ' 
IEmployeeUserServiceUU' ;
,UU; <
EmployeeServiceUU= L
>UUL M
(UUM N
)UUN O
;UUO P
builderVV 
.VV 
ServicesVV 
.VV 
	AddScopedVV &
<VV& '!
IEmployeeAdminServiceVV' <
,VV< =
EmployeeServiceVV> M
>VVM N
(VVN O
)VVO P
;VVP Q
builderWW 
.WW 
ServicesWW 
.WW 
	AddScopedWW &
<WW& '#
IRequestEmployeeServiceWW' >
,WW> ?"
RequestEmployeeServiceWW@ V
>WWV W
(WWW X
)WWX Y
;WWY Z
builderXX 
.XX 
ServicesXX 
.XX 
	AddScopedXX &
<XX& '
IUserServiceXX' 3
,XX3 4
USerServiceXX4 ?
>XX@ A
(XXA B
)XXB C
;XXC D
builderYY 
.YY 
ServicesYY 
.YY 
	AddScopedYY &
<YY& '
ITokenServiceYY' 4
,YY4 5
TokenServiceYY5 A
>YYA B
(YYB C
)YYC D
;YYD E
var]] 
app]] 
=]] 
builder]] 
.]] 
Build]] #
(]]# $
)]]$ %
;]]% &
if`` 
(`` 
app`` 
.`` 
Environment`` 
.``  
IsDevelopment``  -
(``- .
)``. /
)``/ 0
{aa 
appbb 
.bb 

UseSwaggerbb 
(bb 
)bb  
;bb  !
appcc 
.cc 
UseSwaggerUIcc  
(cc  !
)cc! "
;cc" #
}dd 
appff 
.ff 
UseAuthenticationff !
(ff! "
)ff" #
;ff# $
appgg 
.gg 
UseAuthorizationgg  
(gg  !
)gg! "
;gg" #
appjj 
.jj 
MapControllersjj 
(jj 
)jj  
;jj  !
appll 
.ll 
Runll 
(ll 
)ll 
;ll 
}mm 	
}nn 
}oo Ÿ"
~D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Repositories\EmployeeRepository.cs
	namespace 	
FirstAPI
 
. 
Repositories 
{		 
public

 

class

 
EmployeeRepository

 #
:

$ %
IRepository

& 1
<

1 2
int

2 5
,

5 6
Employee

7 ?
>

? @
{ 
readonly  
RequestTarkerContext %
_context& .
;. /
public 
EmployeeRepository !
(! " 
RequestTarkerContext" 6
context7 >
)> ?
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
Employee "
>" #
Add$ '
(' (
Employee( 0
item1 5
)5 6
{ 	
_context 
. 
Add 
( 
item 
) 
; 
_context 
. 
SaveChanges  
(  !
)! "
;" #
return 
item 
; 
} 	
public 
async 
Task 
< 
Employee "
>" #
Delete$ *
(* +
int+ .
key/ 2
)2 3
{ 	
var 
employee 
= 
await  
GetAsync! )
() *
key* -
)- .
;. /
_context 
? 
. 
	Employees 
.  
Remove  &
(& '
employee' /
)/ 0
;0 1
_context 
. 
SaveChanges  
(  !
)! "
;" #
return 
employee 
; 
} 	
public   
async   
Task   
<   
Employee   "
>  " #
GetAsync  $ ,
(  , -
int  - 0
key  1 4
)  4 5
{!! 	
var"" 
	employees"" 
="" 
await"" !
GetAsync""" *
(""* +
)""+ ,
;"", -
var## 
employee## 
=## 
	employees## $
.##$ %
FirstOrDefault##% 3
(##3 4
e##4 5
=>##5 7
e##7 8
.##8 9
Id##9 ;
==##; =
key##= @
)##@ A
;##A B
if$$ 
($$ 
employee$$ 
!=$$ 
null$$  
)$$  !
return%% 
employee%% 
;%%  
throw&& 
new&& #
NoSuchEmployeeException&& -
(&&- .
)&&. /
;&&/ 0
}'' 	
public)) 
async)) 
Task)) 
<)) 
List)) 
<)) 
Employee)) '
>))' (
>))( )
GetAsync))* 2
())2 3
)))3 4
{** 	
var++ 
	employees++ 
=++ 
_context++ $
.++$ %
	Employees++% .
.++. /
Include++/ 6
(++6 7
e++7 8
=>++8 :
e++: ;
.++; <

Department++< F
)++F G
.++G H
ToList++H N
(++N O
)++O P
;++P Q
return,, 
	employees,, 
;,, 
}-- 	
public// 
async// 
Task// 
<// 
Employee// "
>//" #
Update//$ *
(//* +
Employee//+ 3
item//4 8
)//8 9
{00 	
var11 
employee11 
=11 
await11  
GetAsync11! )
(11) *
item11* .
.11. /
Id11/ 1
)111 2
;112 3
_context22 
.22 
Entry22 
<22 
Employee22 #
>22# $
(22$ %
item22% )
)22) *
.22* +
State22+ 0
=221 2
EntityState223 >
.22> ?
Modified22? G
;22G H
_context66 
.66 
SaveChanges66  
(66  !
)66! "
;66" #
return77 
item77 
;77 
}88 	
}99 
}:: µ(
}D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Repositories\RequestRepository.cs
	namespace 	
FirstAPI
 
. 
Repositories 
{ 
public 

class 
RequestRepository "
:# $
IRepository% 0
<0 1
int1 4
,4 5
Request6 =
>= >
{		 
private

 
readonly

  
RequestTarkerContext

 -
_context

. 6
;

6 7
private 
readonly 
ILogger  
<  !
RequestRepository! 2
>2 3
_logger4 ;
;; <
public 
RequestRepository  
(  ! 
RequestTarkerContext! 5
context6 =
,= >
ILogger> E
<E F
RequestRepositoryF W
>W X
loggerY _
)_ `
{ 	
_context 
= 
context 
; 
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
Request !
>! "
Add# &
(& '
Request' .
item/ 3
)3 4
{ 	
item 
. 

RaisedDate 
= 
DateTime &
.& '
Now' *
;* +
_context 
. 
Requests 
. 
Add !
(! "
item" &
)& '
;' (
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return 
item 
; 
} 	
public 
async 
Task 
< 
Request !
>! "
Delete# )
() *
int* -
key. 1
)1 2
{ 	
var 
request 
= 
await 
GetAsync  (
(( )
key) ,
), -
;- .
if 
( 
request 
!= 
null 
)  
{ 
_context 
. 
Requests !
.! "
Remove" (
(( )
request) 0
)0 1
;1 2
await   
_context   
.   
SaveChangesAsync   /
(  / 0
)  0 1
;  1 2
_logger!! 
.!! 
LogInformation!! &
(!!& '
$str!!' 9
+!!: ;
request!!< C
.!!C D
Id!!D F
)!!F G
;!!G H
return"" 
request"" 
;"" 
}## 
return$$ 
null$$ 
;$$ 
}%% 	
public'' 
async'' 
Task'' 
<'' 
Request'' !
>''! "
GetAsync''# +
(''+ ,
int'', /
key''0 3
)''3 4
{(( 	
var)) 
request)) 
=)) 
_context)) "
.))" #
Requests))# +
.))+ ,
FirstOrDefault)), :
()): ;
r)); <
=>))< >
r))> ?
.))? @
Id))@ B
==))C E
key))F I
)))I J
;))J K
if** 
(** 
request** 
!=** 
null** 
)**  
return++ 
request++ 
;++ 
return,, 
null,, 
;,, 
}-- 	
public// 
async// 
Task// 
<// 
List// 
<// 
Request// &
>//& '
>//' (
GetAsync//) 1
(//1 2
)//2 3
{00 	
return11 
_context11 
.11 
Requests11 $
.11$ %
ToList11% +
(11+ ,
)11, -
;11- .
}22 	
public44 
async44 
Task44 
<44 
Request44 !
>44! "
Update44# )
(44) *
Request44* 1
item442 6
)446 7
{55 	
var66 
request66 
=66 
await66 
GetAsync66  (
(66( )
item66) -
.66- .
Id66. 0
)660 1
;661 2
if77 
(77 
request77 
!=77 
null77 
)77  
{88 
_context99 
.99 
Entry99 
<99 
Request99 &
>99& '
(99' (
item99( ,
)99, -
.99- .
State99. 3
=994 5
EntityState996 A
.99A B
Modified99B J
;99J K
await:: 
_context:: 
.:: 
SaveChangesAsync:: /
(::/ 0
)::0 1
;::1 2
return;; 
item;; 
;;; 
}<< 
return== 
null== 
;== 
}>> 	
}?? 
}@@ û!
zD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Repositories\UserRepository.cs
	namespace 	
FirstAPI
 
. 
Repositories 
{ 
public		 

class		 
UserRepository		 
:		  !
IRepository		" -
<		- .
string		. 4
,		4 5
User		6 :
>		: ;
{

 
private 
readonly  
RequestTarkerContext -
_context. 6
;6 7
public 
UserRepository 
(  
RequestTarkerContext 2
context3 :
): ;
{ 	
_context 
= 
context 
; 
}	 

public 
async 
Task 
< 
User 
> 
Add  #
(# $
User$ (
item) -
)- .
{ 	
_context 
. 
Add 
( 
item 
) 
; 
_context 
. 
SaveChanges  
(  !
)! "
;" #
return 
item 
; 
} 	
public 
async 
Task 
< 
User 
> 
Delete  &
(& '
string' -
key. 1
)1 2
{ 	
var 
user 
= 
await 
GetAsync $
($ %
key% (
)( )
;) *
if 
( 
user 
!= 
null 
) 
{ 
_context 
. 
Remove 
(  
user  $
)$ %
;% &
_context 
. 
SaveChanges $
($ %
)% &
;& '
return 
user 
; 
}   
return!! 
null!! 
;!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
User$$ 
>$$ 
GetAsync$$  (
($$( )
string$$) /
key$$0 3
)$$3 4
{%% 	
var&& 
user&& 
=&& 
_context&& 
.&&  
Users&&  %
.&&% &
SingleOrDefault&&& 5
(&&5 6
u&&6 7
=>&&7 9
u&&9 :
.&&: ;
Username&&; C
==&&D F
key&&G J
)&&J K
;&&K L
return'' 
user'' 
;'' 
}(( 	
public** 
async** 
Task** 
<** 
List** 
<** 
User** #
>**# $
>**$ %
GetAsync**& .
(**. /
)**/ 0
{++ 	
var,, 
users,, 
=,, 
await,, 
_context,, %
.,,% &
Users,,& +
.,,+ ,
ToListAsync,,, 7
(,,7 8
),,8 9
;,,9 :
return-- 
users-- 
;-- 
}.. 	
public00 
async00 
Task00 
<00 
User00 
>00 
Update00  &
(00& '
User00' +
item00, 0
)000 1
{11 	
var22 
user22 
=22 
await22 
GetAsync22 %
(22% &
item22& *
.22* +
Username22+ 3
)223 4
;224 5
if33 
(33 
user33 
!=33 
null33 
)33 
{44 
_context55 
.55 
Entry55 
<55 
User55 "
>55" #
(55# $
item55$ (
)55( )
.55) *
State55* /
=550 1
EntityState552 =
.55= >
Modified55> F
;55F G
_context66 
.66 
SaveChanges66 $
(66$ %
)66% &
;66& '
return77 
item77 
;77 
}88 
return99 
null99 
;99 
}:: 	
};; 
}<< ‘!
wD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Services\EmployeeService.cs
	namespace 	
FirstAPI
 
. 
Services 
{ 
public 

class 
EmployeeService  
:! "!
IEmployeeAdminService# 8
{ 
private 
IRepository 
< 
int 
,  
Employee! )
>) *
_repo+ 0
;0 1
public

 
EmployeeService

 
(

 
IRepository

 *
<

* +
int

+ .
,

. /
Employee

0 8
>

8 9
repo

: >
)

> ?
{ 	
_repo 
= 
repo 
; 
} 	
public 
async 
Task 
< 
Employee "
>" #
AddEmployee$ /
(/ 0
Employee0 8
employee9 A
)A B
{ 	
employee 
= 
await 
_repo "
." #
Add# &
(& '
employee' /
)/ 0
;0 1
return 
employee 
; 
} 	
public 
async 
Task 
< 
Employee "
>" #)
ChangeEmployeeDepartmnetAsync$ A
(A B
intB E
idF H
,H I
intJ M
departmnetIdN Z
)Z [
{ 	
var 
employee 
= 
await  
_repo! &
.& '
GetAsync' /
(/ 0
id0 2
)2 3
;3 4
if 
( 
employee 
!= 
null  
)  !
{ 
employee 
. 
DepartmentId %
=& '
departmnetId( 4
;4 5
employee 
= 
await  
_repo! &
.& '
Update' -
(- .
employee. 6
)6 7
;7 8
return 
employee 
;  
} 
return 
null 
; 
} 	
public!! 
async!! 
Task!! 
<!! 
Employee!! "
>!!" #$
ChangeEmployeePhoneAsync!!$ <
(!!< =
int!!= @
id!!A C
,!!C D
string!!E K
phone!!L Q
)!!Q R
{"" 	
var## 
employee## 
=## 
await##  
_repo##! &
.##& '
GetAsync##' /
(##/ 0
id##0 2
)##2 3
;##3 4
if$$ 
($$ 
employee$$ 
!=$$ 
null$$  
)$$  !
{%% 
employee&& 
.&& 
Phone&& 
=&&  
phone&&! &
;&&& '
employee'' 
='' 
await''  
_repo''! &
.''& '
Update''' -
(''- .
employee''. 6
)''6 7
;''7 8
return(( 
employee(( 
;((  
})) 
return** 
null** 
;** 
}++ 	
public-- 
async-- 
Task-- 
<-- 
Employee-- "
>--" #
GetEmployee--$ /
(--/ 0
int--0 3
id--4 6
)--6 7
{.. 	
var// 
employee// 
=// 
await//  
_repo//! &
.//& '
GetAsync//' /
(/// 0
id//0 2
)//2 3
;//3 4
return00 
employee00 
;00 
}11 	
public33 
async33 
Task33 
<33 
List33 
<33 
Employee33 '
>33' (
>33( ) 
GetEmployeeListAsync33* >
(33> ?
)33? @
{44 	
var55 
	employees55 
=55 
await55 !
_repo55" '
.55' (
GetAsync55( 0
(550 1
)551 2
;552 3
return66 
	employees66 
;66 
}77 	
}88 
}99 ˜+
~D:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Services\RequestEmployeeService.cs
	namespace 	
FirstAPI
 
. 
Services 
{ 
public 

class "
RequestEmployeeService '
:( )#
IRequestEmployeeService* A
{		 
private

 
readonly

 
IRepository

 $
<

$ %
int

% (
,

( )
Request

* 1
>

1 2
_repository

3 >
;

> ?
private 
readonly 
IRepository $
<$ %
int% (
,( )
Employee* 2
>2 3
_employeeRepository4 G
;G H
private 
readonly 
ILogger  
<  !"
RequestEmployeeService! 7
>7 8
_logger9 @
;@ A
public "
RequestEmployeeService %
(% &
IRepository #
<# $
int$ '
,' (
Request( /
>/ 0

repository1 ;
,; <
IRepository #
<# $
int$ '
,' (
Employee) 1
>1 2
employeeRepository3 E
,E F
ILogger 
<  "
RequestEmployeeService  6
>6 7
logger8 >
)> ?
{ 	
_repository 
= 

repository $
;$ %
_employeeRepository 
=  !
employeeRepository" 4
;4 5
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
Request !
>! "
CreateRequest# 0
(0 1
Request1 8
request9 @
)@ A
{ 	
request 
. 
Status 
= 
$str &
;& '
var 
result 
= 
await 
_repository  +
.+ ,
Add, /
(/ 0
request0 7
)7 8
;8 9
return 
result 
; 
} 	
public 
async 
Task 
< 
Request !
>! "
DeleteRequest# 0
(0 1
int1 4
id5 7
)7 8
{ 	
var   
request   
=   
await   
_repository    +
.  + ,
GetAsync  , 4
(  4 5
id  5 7
)  7 8
;  8 9
if!! 
(!! 
request!! 
==!! 
null!! 
)!! 
{"" 
throw## 
new## "
NoSuchRequestException## 0
(##0 1
)##1 2
;##2 3
}$$ 
request%% 
.%% 
Status%% 
=%% 
$str%% &
;%%& '
var&& 
result&& 
=&& 
await&& 
_repository&& *
.&&* +
Update&&+ 1
(&&1 2
request&&2 9
)&&9 :
;&&: ;
return'' 
result'' 
;'' 
}(( 	
public** 
async** 
Task** 
<** 
IList** 
<**  
Request**  '
>**' (
>**( )#
GetAllResuestByEmployee*** A
(**A B
int**B E

employeeId**F P
)**P Q
{++ 	
var,, 
employee,, 
=,, 
await,,  
_employeeRepository,,! 4
.,,4 5
GetAsync,,5 =
(,,= >

employeeId,,> H
),,H I
;,,I J
if-- 
(-- 
employee-- 
==-- 
null-- 
)--  
throw.. 
new.. #
NoSuchEmployeeException.. 1
(..1 2
)..2 3
;..3 4
var// 
result// 
=// 
await// 
_repository// *
.//* +
GetAsync//+ 3
(//3 4
)//4 5
;//5 6
var00 
requests00 
=00 
result00 !
.00! "
Where00" '
(00' (
r00( )
=>00) +
r00+ ,
.00, -
	Issuer_Id00- 6
==006 8

employeeId009 C
)00C D
;00D E
if11 
(11 
requests11 
.11 
Count11 
(11 
)11 
>11  !
$num11" #
)11# $
return22 
requests22 
.22  
ToList22  &
(22& '
)22' (
;22( )
throw33 
new33 $
NoRequestRaisedException33 .
(33. /
)33/ 0
;330 1
}44 	
public66 
async66 
Task66 
<66 
Request66 !
>66! "
GetRequestStatus66# 3
(663 4
int664 7
id668 :
)66: ;
{77 	
var88 
result88 
=88 
await88 
_repository88 *
.88* +
GetAsync88+ 3
(883 4
id884 6
)886 7
;887 8
if99 
(99 
result99 
==99 
null99 
)99 
throw:: 
new:: $
NoRequestRaisedException:: 2
(::2 3
)::3 4
;::4 5
return;; 
result;; 
;;; 
}<< 	
}== 
}>> “
tD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Services\TokenService.cs
	namespace 	
FirstAPI
 
. 
Services 
{		 
public

 

class

 
TokenService

 
:

 
ITokenService

  -
{ 
private 
readonly 
string 

_keyString  *
;* +
private 
readonly  
SymmetricSecurityKey -
_key. 2
;2 3
public 
TokenService 
( 
IConfiguration *
configuration+ 8
)8 9
{ 	

_keyString 
= 
configuration &
[& '
$str' 2
]2 3
.3 4
ToString4 <
(< =
)= >
;> ?
_key 
= 
new  
SymmetricSecurityKey +
(+ ,
Encoding, 4
.4 5
UTF85 9
.9 :
GetBytes: B
(B C

_keyStringC M
)M N
)N O
;O P
} 	
public 
async 
Task 
< 
string  
>  !
GenerateToken" /
(/ 0
LoginUserDTO0 <
user= A
)A B
{ 	
string 
token 
= 
string  
.  !
Empty! &
;& '
var 
claims 
= 
new 
List !
<! "
Claim" '
>' (
{ 
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
NameId2 8
,8 9
user9 =
.= >
Username> F
)F G
,G H
new 
Claim 
( 

ClaimTypes $
.$ %
Role% )
,) *
user* .
.. /
Role/ 3
)3 4
} 
; 
var 
cred 
= 
new 
SigningCredentials -
(- .
_key. 2
,2 3
SecurityAlgorithms3 E
.E F

HmacSha256F P
)P Q
;Q R
var   
tokenDescription    
=  ! "
new  # &#
SecurityTokenDescriptor  ' >
{!! 
Subject"" 
="" 
new"" 
ClaimsIdentity"" ,
("", -
claims""- 3
)""3 4
,""4 5
Expires## 
=## 
DateTime## "
.##" #
Now### &
.##& '
AddDays##' .
(##. /
$num##/ 0
)##0 1
,##1 2
SigningCredentials$$ "
=$$# $
cred$$% )
}%% 
;%% 
var(( 
tokenHandler(( 
=(( 
new(( "#
JwtSecurityTokenHandler((# :
(((: ;
)((; <
;((< =
var)) 
myToken)) 
=)) 
tokenHandler)) &
.))& '
CreateToken))' 2
())2 3
tokenDescription))3 C
)))C D
;))D E
token** 
=** 
tokenHandler**  
.**  !

WriteToken**! +
(**+ ,
myToken**, 3
)**3 4
;**4 5
return++ 
token++ 
;++ 
},, 	
}-- 
}.. ô7
sD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\Services\UserService.cs
	namespace		 	
FirstAPI		
 
.		 
Services		 
{

 
public 

class 
USerService 
: 
IUserService +
{ 
private 
readonly 
IRepository $
<$ %
int% (
,( )
Employee* 2
>2 3
_employeeRepository4 G
;G H
private 
readonly 
IRepository $
<$ %
string% +
,+ ,
User- 1
>1 2
_userRepository3 B
;B C
private 
readonly 
ITokenService &
_tokenService' 4
;4 5
private 
readonly 
ILogger  
<  !
USerService! ,
>, -
_logger. 5
;5 6
public 
USerService 
( 
IRepository &
<& '
int' *
,* +
Employee+ 3
>3 4
employeeRepository5 G
,G H
IRepository '
<' (
string( .
,. /
User/ 3
>3 4
userRepository5 C
,C D
ITokenService )
tokenService* 6
,6 7
ILogger #
<# $
USerService$ /
>/ 0
logger1 7
)7 8
{ 	
_employeeRepository 
=  !
employeeRepository" 4
;4 5
_userRepository 
= 
userRepository ,
;, -
_tokenService 
= 
tokenService (
;( )
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
LoginUserDTO &
>& '
Login( -
(- .
LoginUserDTO. :
user; ?
)? @
{ 	
var   
myUSer   
=   
await   
_userRepository   .
.  . /
GetAsync  / 7
(  7 8
user  8 <
.  < =
Username  = E
)  E F
;  F G
if!! 
(!! 
myUSer!! 
==!! 
null!! 
)!! 
{"" 
throw## 
new##  
InvlidUuserException## .
(##. /
)##/ 0
;##0 1
}$$ 
var%% 
userPassword%% 
=%%  
GetPasswordEncrypted%% 3
(%%3 4
user%%4 8
.%%8 9
Password%%9 A
,%%A B
myUSer%%B H
.%%H I
Key%%I L
)%%L M
;%%M N
var&& 
checkPasswordMatch&& "
=&&# $
ComparePasswords&&% 5
(&&5 6
myUSer&&6 <
.&&< =
Password&&= E
,&&E F
userPassword&&F R
)&&R S
;&&S T
if'' 
('' 
checkPasswordMatch'' !
)''! "
{(( 
user)) 
.)) 
Password)) 
=)) 
$str))  "
;))" #
user** 
.** 
Role** 
=** 
myUSer** !
.**! "
Role**" &
;**& '
user++ 
.++ 
Token++ 
=++ 
await++ "
_tokenService++# 0
.++0 1
GenerateToken++1 >
(++> ?
user++? C
)++C D
;++D E
return,, 
user,, 
;,, 
}-- 
throw.. 
new..  
InvlidUuserException.. *
(..* +
)..+ ,
;.., -
}// 	
private11 
bool11 
ComparePasswords11 %
(11% &
byte11& *
[11* +
]11+ ,
password11- 5
,115 6
byte117 ;
[11; <
]11< =
userPassword11> J
)11J K
{22 	
for33 
(33 
int33 
i33 
=33 
$num33 
;33 
i33 
<33 
password33  (
.33( )
Length33) /
;33/ 0
i331 2
++332 4
)334 5
{44 
if55 
(55 
password55 
[55 
i55 
]55 
!=55  "
userPassword55# /
[55/ 0
i550 1
]551 2
)552 3
return66 
false66  
;66  !
}77 
return88 
true88 
;88 
}99 	
private;; 
byte;; 
[;; 
];;  
GetPasswordEncrypted;; +
(;;+ ,
string;;, 2
password;;3 ;
,;;; <
byte;;= A
[;;A B
];;B C
key;;D G
);;G H
{<< 	

HMACSHA512== 
hmac== 
=== 
new== !

HMACSHA512==" ,
(==, -
key==- 0
)==0 1
;==1 2
var>> 
userpassword>> 
=>> 
hmac>> #
.>># $
ComputeHash>>$ /
(>>/ 0
Encoding>>0 8
.>>8 9
UTF8>>9 =
.>>= >
GetBytes>>> F
(>>F G
password>>G O
)>>O P
)>>P Q
;>>Q R
return?? 
userpassword?? 
;??  
}@@ 	
publicBB 
asyncBB 
TaskBB 
<BB 
LoginUserDTOBB &
>BB& '
RegisterBB( 0
(BB0 1
RegisterUserDTOBB1 @
userBBA E
)BBE F
{CC 	
UserDD 
myuserDD 
=DD 
newDD 
RegisterToUserDD ,
(DD, -
userDD- 1
)DD1 2
.DD2 3
GetUserDD3 :
(DD: ;
)DD; <
;DD< =
myuserEE 
=EE 
awaitEE 
_userRepositoryEE *
.EE* +
AddEE+ .
(EE. /
myuserEE/ 5
)EE5 6
;EE6 7
EmployeeFF 
employeeFF 
=FF 
newFF  #
RegisterToEmployeeFF$ 6
(FF6 7
userFF7 ;
)FF; <
.FF< =
GetEmployeeFF= H
(FFH I
)FFI J
;FFJ K
employeeGG 
=GG 
awaitGG 
_employeeRepositoryGG 0
.GG0 1
AddGG1 4
(GG4 5
employeeGG5 =
)GG= >
;GG> ?
LoginUserDTOHH 
resultHH 
=HH  !
newHH" %
LoginUserDTOHH& 2
{II 
UsernameJJ 
=JJ 
myuserJJ !
.JJ! "
UsernameJJ" *
,JJ* +
RoleKK 
=KK 
myuserKK 
.KK 
RoleKK "
,KK" #
}LL 
;LL 
returnMM 
resultMM 
;MM 
}OO 	
}PP 
}QQ ˇ
nD:\Data\d drive\Corp\Gynosys\Hexaware_17Jan2024\Participants\Day8\FirstAPISolution\FirstAPI\WeatherForecast.cs
	namespace 	
FirstAPI
 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
TemperatureC 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
int		 
TemperatureF		 
=>		  "
$num		# %
+		& '
(		( )
int		) ,
)		, -
(		- .
TemperatureC		. :
/		; <
$num		= C
)		C D
;		D E
public 
string 
? 
Summary 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} 