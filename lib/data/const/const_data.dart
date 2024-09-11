import 'package:travelbox/features/cover_quote/model/country_data.dart';
import 'package:travelbox/features/cover_quote/model/language_data.dart';
import 'package:travelbox/features/notifications/models/notifications_settings.dart';

final countries = <CountryData>[
  CountryData('Hong Kong', code: 'HK', flag: '🇭🇰'),
  CountryData('Singapore', code: 'SG', flag: '🇸🇬'),
  CountryData('Malaysia', code: 'MY', flag: '🇲🇾'),
  CountryData('Thailand', code: 'TH', flag: '🇹🇭'),
  CountryData('Indonesia', code: 'ID', flag: '🇮🇩'),
  CountryData('Philippines', code: 'PH', flag: '🇵🇭'),
  CountryData('Vietnam', code: 'VN', flag: '🇻🇳'),
  CountryData('Myanmar', code: 'MM', flag: '🇲🇲'),
  CountryData('Cambodia', code: 'KH', flag: '🇰🇭'),
  CountryData('Laos', code: 'LA', flag: '🇱🇦'),
  CountryData('Brunei', code: 'BN', flag: '🇧🇳'),
  CountryData('Macau', code: 'MO', flag: '🇲🇴'),
  CountryData('Taiwan', code: 'TW', flag: '🇹🇼'),
  CountryData('Japan', code: 'JP', flag: '🇯🇵'),
  CountryData('South Korea', code: 'KR', flag: '🇰🇷'),
  CountryData('China', code: 'CN', flag: '🇨🇳'),
  CountryData('India', code: 'IN', flag: '🇮🇳'),
  CountryData('Sri Lanka', code: 'LK', flag: '🇱🇰'),
  CountryData('Bangladesh', code: 'BD', flag: '🇧🇩'),
  CountryData('Pakistan', code: 'PK', flag: '🇵🇰'),
  CountryData('Nepal', code: 'NP', flag: '🇳🇵'),
  CountryData('Bhutan', code: 'BT', flag: '🇧🇹'),
  CountryData('Maldives', code: 'MV', flag: '🇲🇻'),
  CountryData('Afghanistan', code: 'AF', flag: '🇦🇫'),
  CountryData('Iran', code: 'IR', flag: '🇮🇷'),
  CountryData('Iraq', code: 'IQ', flag: '🇮🇶'),
];

final languages = <CountryData>[
  CountryData('English (UK)', code: 'GB', flag: '🇬🇧'),
  CountryData('繁體中文', code: 'HK', flag: '🇭🇰'),
];

final languagesData = <LanguageData>[
  LanguageData('English (UK)',
      countryCode: 'GB', flag: '🇬🇧', languageCode: 'en'),
  LanguageData('繁體中文', countryCode: 'HK', flag: '🇭🇰', languageCode: 'zh'),
];

final currencies = <CountryData>[
  CountryData('Hong Kong', code: 'HK', flag: '🇭🇰', currency: '\$ HK Dollar'),
  CountryData('Singapore', code: 'SG', flag: '🇸🇬', currency: '\$ SGD'),
  CountryData('Malaysia', code: 'MY', flag: '🇲🇾', currency: 'RM MYR'),
  CountryData('Thailand', code: 'TH', flag: '🇹🇭', currency: '฿ THB'),
  CountryData('Indonesia', code: 'ID', flag: '🇮🇩', currency: 'Rp IDR'),
  CountryData('Vietnam', code: 'VN', flag: '🇻🇳', currency: '₫ VND'),
  CountryData('Australia', code: 'AU', flag: '🇦🇺', currency: '\$ AUD'),
];

NotificationsSettings notificationsSettingsConst = NotificationsSettings(
    promotions: true,
    rewards: true,
    referFriend: true,
    productService: true,
    customerFeedback: true,
    productAnno: true,
    travelExp: true,
    purchasesEmails: true,
    renewals: true,
    reviews: true,
    offersConfirmEmail: true,
    purchaseConfirmEmail: true);

//shared preference constant
const String isLoggedIn = 'isLoggedIn';

final Map<String, String> postalCodePatterns = {
  'AD': r'^(?:AD)*(\d{3})$',
  'AM': r'^(\d{6})$',
  'AR': r'^([A-Z]\d{4}[A-Z]{3})$',
  'AT': r'^(\d{4})$',
  'AX': r'^(?:FI)*(\d{5})$',
  'AZ': r'^(?:AZ)*(\d{4})$',
  'BA': r'^(\d{5})$',
  'BB': r'^(?:BB)*(\d{5})$',
  'BH': r'^(\d{3}\d?)$',
  'BM': r'^([A-Z]{2}\d{2})$',
  'BN': r'^([A-Z]{2}\d{4})$',
  'BR': r'^(\d{8})$',
  'BY': r'^(\d{6})$',
  'CA':
      r'^([ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ]) ?(\d[ABCEGHJKLMNPRSTVWXYZ]\d)$',
  'CL': r'^(\d{7})$',
  'CU': r'^(?:CP)*(\d{5})$',
  'EC': r'^([a-zA-Z]\d{4}[a-zA-Z])$',
  'FI': r'^(?:FI)*(\d{5})$',
  'FO': r'^(?:FO)*(\d{3})$',
  'GB':
      r'^(([A-Z]\d{2}[A-Z]{2})|([A-Z]\d{3}[A-Z]{2})|([A-Z]{2}\d{2}[A-Z]{2})|([A-Z]{2}\d{3}[A-Z]{2})|([A-Z]\d[A-Z]\d[A-Z]{2})|([A-Z]{2}\d[A-Z]\d[A-Z]{2})|(GIR0AA))$',
  'GF': r'^((97|98)3\d{2})$',
  'GP': r'^((97|98)\d{3})$',
  'GU': r'^(969\d{2})$',
  'HN': r'^([A-Z]{2}\d{4})$',
  'HR': r'^(?:HR)*(\d{5})$',
  'HT': r'^(?:HT)*(\d{4})$',
  'IR': r'^(\d{10})$',
  'IS': r'^(\d{3})$',
  'KR': r'^(?:SEOUL)*(\d{6})$',
  'LB': r'^(\d{4}(\d{4})?)$',
  'LT': r'^(?:LT)*(\d{5})$',
  'LV': r'^(?:LV)*(\d{4})$',
  'MD': r'^(?:MD)*(\d{4})$',
  'MT': r'^([A-Z]{3}\d{2}\d?)$',
  'NL': r'^(\d{4}[A-Z]{2})$',
  'PF': r'^((97|98)7\d{2})$',
  'PM': r'^(97500)$',
  'PR': r'^(\d{9})$',
  'PW': r'^(96940)$',
  'RE': r'^((97|98)(4|7|8)\d{2})$',
  'SE': r'^(?:SE)*(\d{5})$',
  'SH': r'^(STHL1ZZ)$',
  'SI': r'^(?:SI)*(\d{4})$',
  'SM': r'^(4789\d)$',
  'SO': r'^([A-Z]{2}\d{5})$',
  'SV': r'^(?:CP)*(\d{4})$',
  'SZ': r'^([A-Z]\d{3})$',
  'TC': r'^(TKCA 1ZZ)$',
  'US': r'^\d{5}(-\d{4})?$',
  'VI': r'^\d{5}(-\d{4})?$',
  'WF': r'^(986\d{2})$',
};

final regexPattern = '^(${postalCodePatterns.values.join('|')})\$';

final quoteDetailAddOns = [
  {
    "id": "1",
    "name": "Cruise Cover",
    "description": "Go on a cruise during the period of insurance?",
    "price": "26.50",
    "subTitle": "More information",
    "isChosen": true,
  },
  {
    "id": "2",
    "name": "Vacation rental protection",
    "description": "Be reimbursed up to HK\$5,000 in repair/replacement...",
    "price": "26.50",
    "subTitle": "Select dates",
    "isChosen": false,
  },
  {
    "id": "3",
    "name": "Personal liability",
    "description":
        "Protection against any incident for which you become legally ride...",
    "price": "150.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "4",
    "name": "Adventure and extreme sports",
    "description": "Coverage for medical-related expenses if you...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "5",
    "name": "Winter sport",
    "description": "Coverage for medical-related expenses if you...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "6",
    "name": "Gadget cover",
    "description": "Cover for unlimited number of gadgets",
    "price": "150.50",
    "subTitle": "See more",
    "isChosen": false,
  }
];

final quoteDetailAddOns2 = [
  {
    "id": "7",
    "name": "Golf cover",
    "description": "Cover for golf equipment, hire of replacement...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "8",
    "name": "Car hire excess waiver",
    "description":
        "Get reimbursed in the event of loss of or damage to the vehicle.",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "9",
    "name": "Cancel for any reason",
    "description":
        "Get reimbursed for any non-refundable trip expenses if you cancel..",
    "price": "150.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "10",
    "name": "Rental car care",
    "description": "Get reimbursed accidental damage and theft related...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "11",
    "name": "Pet care",
    "description": "Get reimbursed veterinary and kenneling expenses...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
];

final adventureExtremeData = [
  "B.A.S.E. jumping, Cliff diving",
  "Bull riding, Running of the bulls",
  "Bungee jumping",
  "Hot air ballooning",
  "Parachuting, Skydiving",
  "Fly-by-wire",
  "Paragliding, Hang gliding",
  "Heli-skiing, Helisnowboarding",
  "Wingsuit flying",
  "Rock climbing without equipment (Free soloing)",
  "Bodily contact sports",
  "Mountain climbing over 9,000 feet (2,700 meters)",
  "Motorsport or motor racing",
  "Multi-sport endurance competitions",
  "Parkour",
  "Scuba diving if the depth exceeds 131 feet (40 meters), Free diving",
  "Any activity materially similar to the above",
];

final winterSportProtectionData = [
  "Skiing and snowboarding in ski resorts",
  "Cross-country skiing on marked trails",
  "Skiing in terrain parks",
  "Heli-skiing & heli-boarding ",
  "Snowmobiling, ice skating, and snow rafting",
];

final personalProtectionData = [
  "all sums which you shall become legally liable to pay as compensation",
  "all law costs awarded to any claimant or incurred in the defence of any claim that is contested by us or with our consent",
];

final gadgetData = [
  "Accidental loss or theft",
  "Accidental or malicious damage",
  "Liquid damage",
  "Unauthorised call, text or data usage",
  "Breakdown",
];

final golfCoverData = [
  "Cover for owned golf equipment up to HK\$10,000",
  "Cover to hire replacement golf equipment up to HK\$5,000",
  "Cover for course closure up to £1500",
  "Hole in One cover of \$3,000",
];

const termsData = '''
    <h2>PLEASE READ THESE TERMS AND CONDITIONS OF USE (“TERMS”) CAREFULLY BEFORE USING THIS SITE.</h2>
    <p>Welcom to withLyla.com. We refer to this website or application and its entire contents features design and functionality as the “Site.” The Site and Lyla brand (“Lyla” and withLyla.com) is owned by Travelbox Tech Limited (“Travelbox”) (registered in Hong Kong under company number CR3105973) working in partnership with i-Brokers Limited (“i-Brokers” and together “we”, “us” or “our”) an authorized insurance broker with Insurance Authority License Number FB1831 whose business it is to arrange insurance products and services for its clients.</p>
    <p>By using this Site you represent and warrant that you have read and accept the following Terms.</p>
    
    <h2>Your Acceptance of these Terms</h2>
    <ol>
        <li><strong>You Accept Posted Terms.</strong> Any time you make use of this Site you on behalf of yourself and your organisation agree to comply with and be bound by the Terms in effect on your date of access (see “effective date” above). If you do not agree to be bound by the Terms or do not have the authority to bind your organisation to these Terms you should not access or view this Site.</li>
        <li><strong>You Accept Amendments to Terms.</strong> Please be aware that Travelbox may amend the Terms from time to time. While at its sole discretion Travelbox may require you to directly acknowledge your acceptance of these Terms including upon material changes to the Terms you are on notice that your ongoing use of the Site alone constitutes your acceptance of the Terms and any changes. If we make changes to these Terms we will update the “Effective Date” at the top of the page. Accordingly please continue to review the Terms whenever accessing the Site.</li>
        <li><strong>You are Legally Capable of Accepting the Terms.</strong> You are at least 18 years old and/or possess the legal authority to form legally binding contracts under applicable law to use this Site.</li>
        <li><strong>Your other written agreements are separate from these Terms.</strong> These Terms govern your use of this Site and are separate from the terms or conditions of any other agreements you have entered into with Travelbox.</li>
    </ol>
    
    <h2>Your Rights and Obligations as a User of this Site</h2>
    <ol start="5">
        <li><strong>Your Permitted Use.</strong> You may access and use this Site for the sole purpose that this Site has been made available to you by Travelbox (the “Purpose”). You shall not access or use this Site for any other reason other than the Purpose including without limitation penetration testing or any of the prohibited uses set forth below.</li>
        <li><strong>Your Account.</strong> In order to use this Site you may be required to register an account. If this Site required you to register an account it is intended for access and use by authorized users only (“Authorized Users”). By using this Site you represent and warrant that you are an Authorized User. You are entirely responsible for maintaining the confidentiality of your login credentials if applicable and for all activities undertaken by any party using your account. You agree to notify Travelbox immediately if you become aware of any unauthorized use of your account or other breach of security. Travelbox will not be liable for any loss you incur based on another party’s use of your account either with or without your consent but your actions may make you liable for losses sustained by Travelbox or others. You agree not to use anyone else’s account without the express permission of the account holder and Travelbox’s authorization.</li>
        <li><strong>Prohibited Uses.</strong> You agree not to make any use of this Site that:
            <ul>
                <li>is illegal fraudulent or abusive;</li>
                <li>is defamatory or obscene;</li>
                <li>could compete with the business of Travelbox its business partners or licensees;</li>
                <li>offers Site access or content for sale assignment sublicensing or otherwise makes the content available to a third party;</li>
                <li>violates the intellectual property or ownership rights of Travelbox or a third party including making derivative works based on the Site;</li>
                <li>could interfere with any third party’s use and enjoyment of the Site;</li>
                <li>introduces viruses or other harmful programs or code;</li>
                <li>circumvents passwords access controls captchas robot.txt scripts and similar technologies intended to protect users and/or our intellectual property;</li>
                <li>archives mines or harvests any personal information intellectual property or any part of this Site;</li>
                <li>tests the security of the Site or otherwise attempts to gain unauthorized access to the confidential information of Travelbox or its other clients or to Travelbox’s computer systems or networks connected to any Travelbox server through hacking password mining or any other means;</li>
                <li>could damage disable overburden or impair any Travelbox server or the networks connected to any Travelbox server; or</li>
                <li>disseminates unsolicited promotional or advertising material spam or similar materials or any volume messages which may interfere with the operation of this Site or with the enjoyment of this Site by other visitors.</li>
            </ul>
        </li>
        <li><strong>Linking.</strong> You may not make any part of the Site available as part of another website or application whether by hyperlink framing on the Internet caching or otherwise unless you have been authorized to do so in writing by Travelbox. Travelbox reserves the right to disable any unauthorized links or frames. Travelbox specifically disclaims any responsibility for the contents of any third-party websites or applications that link to this Site and for any injury you may incur from third-party websites or applications linking or framing this Site.</li>
        <li><strong>User Comments and Discussion Forums.</strong> We may provide an opportunity for you and other users to post comments or participate in discussion forums on this Site. Travelbox does not endorse any user posts and they should not be considered as reflecting the opinion of Travelbox. If you post any comments on this Site you agree that you are entirely responsible for the content of your post and you will not post material that is inaccurate contains personal information of yourself or a third party promotes for sale and product or service or violates the expectations for user conduct provided in paragraphs 5 and 6. You also understand that anything you post will be considered non-confidential and non-proprietary and you grant Travelbox a limited license to use store and copy such content.</li>
    </ol>
    
    <h2>Site Purpose and Content</h2>
    <ol start="10">
        <li><strong>Intellectual Property.</strong> You understand and agree that the Site has been developed by Travelbox and our licensors through the expenditure of substantial time effort and money and constitutes valuable intellectual property and trade secrets of Travelbox. You further agree that the Site including but not limited to text content photographs video audio and graphics is protected by copyrights trademarks service marks international treaties and/or other proprietary rights and laws of the U.S. and other countries. The Site is also protected as a collective work or compilation under U.S. copyright and other laws and treaties. All individual articles columns and other elements making up the Site are also copyrighted works. The trademarks service marks trade names logos designs and sounds associated with the Site are owned by Travelbox or third parties. You agree to abide by all applicable copyright trademark and other laws as well as any additional copyright notices or restrictions contained in the Site. Where permitted on the Site you may download materials from the Site and/or print a reasonable number of copies for your personal use or use within your organization provided that all copies retain all copyright and other proprietary notices. Such copies and all Site Content are solely for your information and may not be quoted in whole or in part or otherwise referred to disclosed or delivered by you to any person or entity outside of your organization without the prior written consent of Travelbox.</li>
        <li><strong>License.</strong> You understand and agree that accessing and/or using the Site does not grant you any ownership rights or licenses to the Site other than the limited right to use the Site in accordance with the Terms.</li>
        <li><strong>Site Content; Availability.</strong> You understand that the Site is provided “AS IS” and “AS AVAILABLE.” Your access is limited by our Site functionality your access levels and the Terms. Travelbox reserves the right at any time and without notice to enhance modify alter suspend or permanently discontinue all or any part of this Site and to restrict or prohibit access to it.</li>
        <li><strong>Links to Third-Party Sites.</strong> Solely for your convenience this Site may provide links and/or redirect you to third-party websites or applications. Travelbox has no control over third-party websites or applications is not liable for their accuracy content or security and makes no endorsement of third-party websites’ or applications’ owners contents or services. Your use of third-party websites or applications is at your sole risk so you should review the terms and conditions and privacy policies of any third party prior to use of their site.</li>
        <li><strong>Global Access.</strong> Travelbox is based in Hong Kong and provides this Site for use by persons located in Hong Kong. We make no claims that the Site or any of its content is accessible or appropriate outside of Hong Kong and you are on notice that accessing the Site from jurisdictions where the Site is illegal is strictly prohibited. If you access the Site from outside of Hong Kong you do so on your own initiative and are responsible for compliance with local laws.</li>
    </ol>
    
    <h2>Privacy</h2>
    <p>Travelbox’s privacy policy governs our use of information collected from you and can be found at https://www.withlyla.com/privacy-policy/ (“Privacy Policy”). The Privacy Policy describes how we handle and protect personal data and privacy including how we use cookies and similar technology on the Site. By accessing the Site you consent to our Privacy Policy.</p>
    
    <h2>Disclaimers and Limitations of Liability</h2>
    <ol start="15">
        <li><strong>Disclaimer of Warranty.</strong> You understand that the Site is provided “AS IS” and “AS AVAILABLE” and that Travelbox its affiliates its licensors or service providers do not make any representations or warranties regarding the Site including without limitation that the Site will be secure or available or that the Site content is accurate and free of errors. To the extent permitted by law we disclaim all express or implied warranties including without limitation warranties of non-infringement and the implied warranties of fitness for a particular purpose and merchantability. Additionally Travelbox does not make any representation regarding the availability accuracy or completeness of any information on this Site and the links to other sites are for convenience only. We do not endorse any linked sites or have any responsibility for their content or availability.</li>
        <li><strong>Limitation of Liability.</strong> You agree that under no circumstances shall Travelbox or its affiliates its licensors or service providers be liable to you for any special incidental indirect consequential or punitive damages losses or expenses (including lost profits business interruption and loss of data) directly or indirectly arising out of the use of or inability to use this Site or any of the content or materials contained therein even if Travelbox or its representatives have been advised of the possibility of such damages. You also agree that Travelbox its affiliates its licensors or service providers are not responsible for any damage to your computer system or loss of data that results from the download or use of any material on the Site. In no event shall the aggregate liability of Travelbox its affiliates its licensors or service providers exceed one thousand Hong Kong Dollars (HK\$1,000).</li>
        <li><strong>Indemnification.</strong> You agree to indemnify defend and hold harmless Travelbox its affiliates its licensors and service providers from and against any and all claims losses liabilities damages costs and expenses (including reasonable attorneys’ fees) arising out of or in any way related to your use or misuse of this Site your violation of these Terms or your violation of any third-party rights including without limitation any copyright trademark property or privacy right.</li>
    </ol>
  ''';

final quoteDetailAddOnsWeb = [
  {
    "id": "1",
    "name": "Cruise Cover",
    "description": "Go on a cruise during the period of insurance?",
    "price": "26.50",
    "subTitle": "More information",
    "isChosen": true,
  },
  {
    "id": "2",
    "name": "Vacation rental protection",
    "description": "Be reimbursed up to HK\$5,000 in repair/replacement...",
    "price": "26.50",
    "subTitle": "Select dates",
    "isChosen": false,
  },
  {
    "id": "3",
    "name": "Personal liability",
    "description":
    "Protection against any incident for which you become legally ride...",
    "price": "150.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "4",
    "name": "Adventure and extreme sports",
    "description": "Coverage for medical-related expenses if you...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "5",
    "name": "Winter sport",
    "description": "Coverage for medical-related expenses if you...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "6",
    "name": "Gadget cover",
    "description": "Cover for unlimited number of gadgets",
    "price": "150.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "7",
    "name": "Golf cover",
    "description": "Cover for golf equipment, hire of replacement...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "8",
    "name": "Car hire excess waiver",
    "description":
    "Get reimbursed in the event of loss of or damage to the vehicle.",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "9",
    "name": "Cancel for any reason",
    "description":
    "Get reimbursed for any non-refundable trip expenses if you cancel..",
    "price": "150.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "10",
    "name": "Rental car care",
    "description": "Get reimbursed accidental damage and theft related...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
  {
    "id": "11",
    "name": "Pet care",
    "description": "Get reimbursed veterinary and kenneling expenses...",
    "price": "26.50",
    "subTitle": "See more",
    "isChosen": false,
  },
];