import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/BanksInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/ClubsInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/EducationInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/ElectricityInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/FinancialInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/GasInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/InternetInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/LandLineInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/MobileRechargeInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/TraficInvoice.dart';
import 'package:gradp2p/view/screens/BillPayment/Invoices/WaterInvoice.dart';
import 'package:gradp2p/view/screens/Home/Wallet.dart';
import 'package:gradp2p/view/screens/ManageCards/defoultCardBalance.dart';
import 'package:gradp2p/core/constants/routes.dart';
import 'package:gradp2p/core/middleware/myMiddleWare.dart';
import 'package:gradp2p/view/screens/BillPayment/BanksBills.dart';
import 'package:gradp2p/view/screens/BillPayment/BillPaymentScreen.dart';
import 'package:gradp2p/view/screens/BillPayment/EducationBills.dart';
import 'package:gradp2p/view/screens/BillPayment/ElectricityBill.dart';
import 'package:gradp2p/view/screens/BillPayment/GasBills.dart';
import 'package:gradp2p/view/screens/BillPayment/InternetBill.dart';
import 'package:gradp2p/view/screens/BillPayment/LandLineBill.dart';
import 'package:gradp2p/view/screens/BillPayment/MobileRechare.dart';
import 'package:gradp2p/view/screens/BillPayment/TraficFines.dart';
import 'package:gradp2p/view/screens/BillPayment/WaterBills.dart';
import 'package:gradp2p/view/screens/BillPayment/clubSubsribtion.dart';
import 'package:gradp2p/view/screens/BillPayment/finantialBills.dart';
import 'package:gradp2p/view/screens/CRYPTO%20copy/BuyCrypto.dart';
import 'package:gradp2p/view/screens/CRYPTO%20copy/CryptoHome.dart';
import 'package:gradp2p/view/screens/CRYPTO%20copy/SellCrypto.dart';
import 'package:gradp2p/view/screens/Donations.dart';
import 'package:gradp2p/view/screens/ManageCards/Recharge.dart';
import 'package:gradp2p/view/screens/ManageCards/addCard.dart';
import 'package:gradp2p/view/screens/ManageCards/manageCards.dart';
import 'package:gradp2p/view/screens/ManageCards/withdrow.dart';
import 'package:gradp2p/view/screens/QRScreens/ConfirmTransactionScreen.dart';
import 'package:gradp2p/view/screens/QRScreens/generateCodeQR.dart';
import 'package:gradp2p/view/screens/QRScreens/generateQRcollect.dart';
import 'package:gradp2p/view/screens/QRScreens/scanQr.dart';
import 'package:gradp2p/view/screens/SplashScreen.dart';
import 'package:gradp2p/view/screens/auth/forgotPassword/confirmcode.dart';
import 'package:gradp2p/view/screens/auth/forgotPassword/newPass.dart';
import 'package:gradp2p/view/screens/auth/forgotPassword/phoneNumber.dart';
import 'package:gradp2p/view/screens/auth/login.dart';
import 'package:gradp2p/view/screens/auth/otp.dart';
import 'package:gradp2p/view/screens/auth/phoneVarification.dart';
import 'package:gradp2p/view/screens/auth/signup.dart';
import 'package:gradp2p/view/screens/bottomNavBar.dart';
import 'package:gradp2p/view/screens/chatboot/ChatBootsplash.dart';
import 'package:gradp2p/view/screens/collect/collectSummary.dart';
import 'package:gradp2p/view/screens/Home/dashboard.dart';
import 'package:gradp2p/view/screens/Home/home%20.dart';
import 'package:gradp2p/view/screens/onboardingScreen.dart';
import 'package:gradp2p/view/screens/recieveScreens/recieveScreen.dart';
import 'package:gradp2p/view/screens/sendScreens/sendScreen.dart';
import 'package:gradp2p/view/screens/service.dart';
import 'package:gradp2p/view/screens/transactionHistory.dart';
import 'package:gradp2p/view/screens/collect/collectNotifications.dart';
import 'package:gradp2p/view/widget/CryptoHistory.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const OnBoarding(), middlewares: [Mymiddleware()]),
  GetPage(name: AppRoute.SplashScreen, page: () => const SplashScreen()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.Signup, page: () => const Signup()),
  GetPage(
      name: AppRoute.Phonevarification, page: () => const Phonevarification()),
  GetPage(name: AppRoute.otp, page: () => const otp()),
  GetPage(name: AppRoute.Home, page: () => Home()),
  GetPage(name: AppRoute.forgetPassPhone, page: () => forgetPassPhone()),
  GetPage(name: AppRoute.Confirmcode, page: () => Confirmcode()),
  GetPage(name: AppRoute.Newpass, page: () => Newpass()),
  GetPage(name: AppRoute.Bottomnavbar, page: () => Bottomnavbar()),
  GetPage(name: AppRoute.Sendscreen, page: () => Sendscreen()),
  GetPage(name: AppRoute.Recievescreen, page: () => Recievescreen()),
  GetPage(name: AppRoute.transaction, page: () => transaction()),
  GetPage(name: AppRoute.DonationsScreen, page: () => DonationsScreen()),
  GetPage(name: AppRoute.Billpaymentscreen, page: () => Billpaymentscreen()),
  GetPage(name: AppRoute.Electricitybill, page: () => Electricitybill()),
  GetPage(name: AppRoute.Internetbill, page: () => Internetbill()),
  GetPage(name: AppRoute.Landlinebill, page: () => Landlinebill()),
  GetPage(name: AppRoute.Mobilerecharge, page: () => Mobilerecharge()),
  GetPage(name: AppRoute.Gasbills, page: () => Gasbills()),
  GetPage(name: AppRoute.Waterbills, page: () => Waterbills()),
  GetPage(name: AppRoute.Educationbills, page: () => Educationbills()),
  GetPage(name: AppRoute.Traficfines, page: () => Traficfines()),
  GetPage(name: AppRoute.Clubsubsribtion, page: () => Clubsubsribtion()),
  GetPage(name: AppRoute.Finantialbills, page: () => Finantialbills()),
  GetPage(name: AppRoute.Banksbills, page: () => Banksbills()),
  GetPage(name: AppRoute.manageCards, page: () => manageCards()),
  GetPage(name: AppRoute.CryptoHome, page: () => CryptoHome()),
  GetPage(name: AppRoute.CollectNoti, page: () => CollectNoti()),
  GetPage(
      name: AppRoute.ConfirmTransactionScreen,
      page: () => ConfirmTransactionScreen(
            qrData: '',
          )),
  GetPage(name: AppRoute.ScanQRScreen, page: () => ScanQRScreen()),
  GetPage(
      name: AppRoute.GenerateQRScreen,
      page: () => GenerateQRScreen(
            qrData: [],
          )),
  GetPage(name: AppRoute.ReceiveMoneyScreen, page: () => ReceiveMoneyScreen()),
  GetPage(
      name: AppRoute.Collectsummary,
      page: () => Collectsummary(
            notification: {},
          )),
  GetPage(name: AppRoute.service, page: () => service()),
  GetPage(name: AppRoute.Dashboard, page: () => Dashboard()),
  GetPage(name: AppRoute.Buycrypto, page: () => Buycrypto()),
  GetPage(name: AppRoute.Sellcrypto, page: () => Sellcrypto()),
  GetPage(name: AppRoute.Withdrow, page: () => Withdrow()),
  GetPage(name: AppRoute.Recharge, page: () => Recharge()),
  GetPage(
      name: AppRoute.checkdefoultBalance, page: () => checkdefoultBalance()),
  GetPage(name: AppRoute.addCard, page: () => addCard()),
  GetPage(name: AppRoute.Wallet, page: () => Wallet()),
  GetPage(name: AppRoute.SplashBot, page: () => SplashBot()),
  GetPage(name: AppRoute.Cryptohistory, page: () => Cryptohistory()),
  GetPage(name: AppRoute.Electricityinvoice, page: () => Electricityinvoice()),
  GetPage(name: AppRoute.Banksinvoice, page: () => Banksinvoice()),
  GetPage(name: AppRoute.Financialinvoice, page: () => Financialinvoice()),
  GetPage(name: AppRoute.Clubsinvoice, page: () => Clubsinvoice()),
  GetPage(name: AppRoute.Traficinvoice, page: () => Traficinvoice()),
  GetPage(name: AppRoute.Educationinvoice, page: () => Educationinvoice()),
  GetPage(name: AppRoute.Landlineinvoice, page: () => Landlineinvoice()),
  GetPage(name: AppRoute.Internetinvoice, page: () => Internetinvoice()),
  GetPage(
      name: AppRoute.Mobilerechargeinvoice,
      page: () => Mobilerechargeinvoice()),
  GetPage(name: AppRoute.Gasinvoice, page: () => Gasinvoice()),
  GetPage(name: AppRoute.Waterinvoice, page: () => Waterinvoice()),
];
