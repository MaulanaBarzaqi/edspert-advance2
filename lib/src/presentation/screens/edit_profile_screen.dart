import 'dart:io';

import 'package:advance/src/presentation/manager/profile/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () async {
                pickedImage = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                  imageQuality: 40,
                );
                // await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: (pickedImage == null)
                  ? Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Icon(Icons.person_2),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.file(
                        width: 70,
                        height: 70,
                        File(pickedImage!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          //bungkus button dgn bloc
          BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is UploadImageSucces) {
                //call api edit profile
                print('download url: ${state.downloadUrl}');
              }
            },
            builder: (context, state) {
              if (state is UploadImageLoading) {
                return CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: () {
                  if (pickedImage == null) {
                    print('image must be selected !');
                    return;
                  }
                  // upload
                  context
                      .read<ProfileBloc>()
                      .add(UploadImageEvent(pickedImage!));
                },
                child: const Text('Save'),
              );
            },
          )
        ],
      ),
    );
  }
}
//kalo gagal liat menit 1:26:19