# IoT_AR_scanner
Developing AR scanner for IoT devices and data they share using Unity 3D and Vuforia.

## About the project
In the next few months there will be surge of Augmented Reality apps. As a result, there is a very real security risk to organizations that don't prepare for the impact that AR will have on their networks and security. For example, an employee pointing their device at a printer in the office, to receive instruction on how to change the toner or clear a paper jam; or a mechanical engineer using a tablet to get information on repairing critical equipment in an airplane. It is easy to see the inherent risks. The traffic that enables all this magic to happen is crossing the business network, revealing details such as IP addresses, location, type of device, user permissions, and more. If a hacker intercepts that traffic - as they have already been able to with Pokémon GO traffic (a popular game on mobile devices)-it could reveal too much about the user and the network.

The Pokémon GO app -like many other AR apps - uses the device's location data to deliver the appropriate information to users, according to their surroundings. It isn't difficult to imagine a hacker combining that location data with other personal information (let's not forget that the original Pokémon GO user agreement allowed Niantic to access user information including Google profiles, histories and past searches), to build up detailed, targeted pictures of users' behaviour. That sort of data is valuable to a criminal. Also, communication between the Pokémon GO app and its servers is done via HTTPS, but early versions of the app did not support certificate pinning, making it easy perform man-in-the-middle exploits to intercept data.

As such, it's easy to see the types of user-specific data that AR apps reveal as part of their normal functions - and the possibilities this presents to hackers for snooping and data manipulation if the application's security has any vulnerabilities. Other threats such as sniffing, data manipulation and man-in-middle can make the content unreliable even if the source is authentic. AR lacks a uniform or standardized security standard. AR Markup Language (ARML) doesn't have comprehensive security controls and neither are they followed universally. Additionally, AR portals depend on web browsers, but these browsers do not support AR functionality. This project will utilise tools and techniques from Human-Computer Interaction in addressing security related issues in AR headsets. For example, system state and security functions should: be visible, be easy to use, be suitable for advanced as well as first time users and avoid heavy use of technical vocabulary or advanced terms.

## Project approach
### Step 1: Recognizing the object
![Step1](https://github.com/bassel97/IoT_AR_scanner/blob/master/Descriptions/Step1.png "Step 1")

### Step 2: Getting the object data
![Step2](https://github.com/bassel97/IoT_AR_scanner/blob/master/Descriptions/Step2.png "Step 2")

## Project Early Prototype
Early prototype with hardcoded data on a normal smart plug.
<img src="https://github.com/bassel97/IoT_AR_scanner/blob/master/Progress/Plug_AR_Sample.gif" alt="Prototype Sample"
	title="Sample" width=100% />
`Footage recorded from running application on mobile phone`

## Data Used
|Type of device|Model type|IoT device manufacturer|Type of IoT-app (iOS, Android)|
|:------------:|:--------:|:---------------------:|:----------------------------:|
|Smart plug|**HS110**|TP-Link|KASA version 2.11.0|
|Smart camera|**NC200**|TP-Link|TpCamera version 3.1.12|
|NetCam HD|**F7D7601fc**|Belkin|NetCam version 2.0.4|
|Smart lamp|**B22**|Lifx|LIFX version 3.13.0|

Data provided by Dr. [Alanoud Subahi](SubahiAT@cardiff.ac.uk)

## Future Work
- Add 3D objects to the Vuforia database.
- Show live feedback of the data being used by the network.
