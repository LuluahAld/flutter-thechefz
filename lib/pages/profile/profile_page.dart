import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/User.dart';
import 'package:thechefz/pages/orders/contactus_page.dart';
import 'package:thechefz/pages/profile/fav_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 20,
                      color: textP,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    color: orange,
                    size: 30,
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  color: orange,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '${userNow[0].phoneNumber}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.edit_note,
                    color: purple,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ProfileWalletCard(img: 'images/profile/wallet.png', title: 'Wallet', desc: '0.00 SAR'),
                  SizedBox(
                    width: 4,
                  ),
                  ProfileWalletCard(img: 'images/profile/points.png', title: 'Points', desc: '0'),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              ProfileOptions(
                onChanged: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOptions extends StatelessWidget {
  final Function onChanged;
  const ProfileOptions({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileOptionsCard(
          icon: Icons.payments_outlined,
          title: 'Payment Cards',
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FavPage()));
          },
          child: const ProfileOptionsCard(
            icon: Icons.favorite_border,
            title: 'My Favorites',
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsPage()));
          },
          child: const ProfileOptionsCard(
            icon: Icons.connect_without_contact,
            title: 'Contact us',
          ),
        ),
        const ProfileOptionsCard(
          icon: Icons.share,
          title: 'Share App',
        ),
        const ProfileOptionsCard(
          icon: Icons.live_help,
          title: 'FAQ',
        ),
        InkWell(
          onTap: () {
            FirebaseAuth.instance.signOut();
            userNow.removeLast();

            onChanged();
          },
          child: Row(
            children: const [
              Icon(
                Icons.exit_to_app,
                color: Colors.red,
                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileOptionsCard extends StatelessWidget {
  final icon;
  final title;

  const ProfileOptionsCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.grey.shade400,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey.shade400,
            )
          ],
        ),
        const Divider(
          height: 40,
          thickness: 0.6,
        )
      ],
    );
  }
}

class ProfileWalletCard extends StatelessWidget {
  final img;
  final title;
  final desc;
  const ProfileWalletCard({
    super.key,
    required this.img,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 196,
      height: 70,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 25.0,
          )
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            img,
            width: 52,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 18,
                  color: textP,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
