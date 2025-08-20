/*
// ADD CANDIDATE DETAILS


 AlertBox2(
                      containerText: 'Add a Candidate',
                      circularAvatar: Image.asset('assets/images/image1.png'),
                      textField1: MyTextField(controller: firstNameController, hintText: 'First Name'),
                      textField2: MyTextField(controller: lastNameController, hintText: 'Last Name'),
                      button: MyButton(buttonText: 'Add', onPressed: (){}),
                    )



// SUCCESSFUL
AlertBox1(containerText: 'Successful', containerImage: Image.asset('assets/images/logo.jpg'), imageHeight: 120, imageWidth: 120,)


// DECLINED
AlertBox1(containerText: 'Declined', containerImage: Image.asset('assets/images/declined.png',
                   ),
                   ), imageHeight: 120, imageWidth: 120,)

                    */

                    /*


                    String? selectedRole;
  final List<String> roles = ['Super User', 'Admin', 'Voters'];
// drop down selection
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container  that carries the drop down selection
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: selectedRole,
                          isExpanded: true,
                          underline: SizedBox(),
                          hint: Text(
                            'Choose a role',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          items:
                              roles.map((role) {
                                return DropdownMenuItem(
                                  value: role,
                                  child: Text(role),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),


                   

                   // container for select date option

                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white, width: 1.5),
            color: Colors.transparent,
                    */






                    