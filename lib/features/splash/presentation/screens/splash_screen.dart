import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/features/splash/presentation/screens/interests_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController =
      TextEditingController(); // For Sign Up

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      _showBottomSheet(context);
    }
  }

  void _showBottomSheet(BuildContext context) {
    bool isSignIn = _tabController.index == 0;

    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (context) => SingleChildScrollView(
            controller: ModalScrollController.of(context),

            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: isSignIn ? signInSheet() : signUpSheet(),
          ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/splash_screen/Group 3090.png"),
                SizedBox(height: 30),
                Text(
                  "Dicover all  about sport",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

                SizedBox(height: 10),

                Text(
                  "Search millions of jobs and get the inside scoop on companies. Wait for what? Let’s get start it!",

                  style: Theme.of(context).textTheme.bodySmall,
                ),

                SizedBox(height: 30),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tabs: [Tab(text: "Sign In"), Tab(text: "Sign Up")],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signInSheet() {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome", style: Theme.of(context).textTheme.headlineMedium),
          TextField(
            controller: _emailController,

            decoration: InputDecoration(
              fillColor: AppColors.primary,
              filled: true,
              hintStyle: TextStyle(color: AppColors.slightlyGreyColor),
              prefixIconColor: AppColors.slightlyGreyColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Email",
              prefixIcon: ImageIcon(AssetImage("assets/icons/Message.png")),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              fillColor: AppColors.primary,
              filled: true,
              hintStyle: TextStyle(color: AppColors.slightlyGreyColor),
              prefixIconColor: AppColors.slightlyGreyColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Password",
              prefixIcon: ImageIcon(AssetImage("assets/icons/Password.png")),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.eye_slash),
              ),
              suffixIconColor: AppColors.slightlyGreyColor,
            ),
            obscureText: true,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Remember me",
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                Text("Forgot Password", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterestsScreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: FittedBox(child: Text("Sign in")),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have account? ",
                style: Theme.of(context).textTheme.bodySmall,
              ),

              Text("Sign UP", style: TextStyle(color: AppColors.buttonColor)),
            ],
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget signUpSheet() {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome", style: Theme.of(context).textTheme.headlineMedium),
          TextField(
            controller: _emailController,

            decoration: InputDecoration(
              fillColor: AppColors.primary,
              filled: true,
              hintStyle: TextStyle(color: AppColors.slightlyGreyColor),
              prefixIconColor: AppColors.slightlyGreyColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Email",
              prefixIcon: ImageIcon(AssetImage("assets/icons/Message.png")),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              fillColor: AppColors.primary,
              filled: true,
              hintStyle: TextStyle(color: AppColors.slightlyGreyColor),
              prefixIconColor: AppColors.slightlyGreyColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Password",
              prefixIcon: ImageIcon(AssetImage("assets/icons/Password.png")),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.eye_slash),
              ),
              suffixIconColor: AppColors.slightlyGreyColor,
            ),
            obscureText: true,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Remember me",
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                Text("Forgot Password", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterestsScreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: FittedBox(child: Text("Sign in")),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have account? ",
                style: Theme.of(context).textTheme.bodySmall,
              ),

              Text("Sign UP", style: TextStyle(color: AppColors.buttonColor)),
            ],
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
