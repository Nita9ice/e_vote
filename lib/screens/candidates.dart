import 'package:flutter/material.dart';

class Candidates extends StatelessWidget {
  const Candidates({super.key});

  final List<Map<String, String>> candidates = const [
    {
      "name": "BEATRICE BERNARD",
      "bio": """Vote for better science lab and 
serene environment..""",
      "image": "assets/images/Ellipse 3.jpg"
    },
    {
      "name": "BEAUTY OBINNA",
      "bio": """vote for a better social life around campus""",
      "image": "assets/images/Ellipse 4.jpg"
    },
    {
      "name": "NOSA OSAGIE",
      "bio": """.Vote for peace, equity and
inclusiveness.""",
      "image": "assets/images/Ellipse 5.jpg"
    },
    {
      "name": "OSARO FELIX",
      "bio": """Vote for a better campus life
and student welfare..""",
      "image": "assets/images/Ellipse 6.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
  
        child: SafeArea(
            
            child: Column(
              spacing:5.0 ,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
               SizedBox(height:100,),
                         Icon(Icons.arrow_back,color: Colors.white,),
                           const Text("Cast Your Vote",style: TextStyle(color: Colors.white,
               fontFamily: 'Roboto',
               fontSize: 20,
               fontWeight: FontWeight.w700,
               ),
               ),
                Row(

                  children: [
             Padding(padding: const EdgeInsets.all(50)),
                    Image.asset(
                      "assets/images/logo.jpg",
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "E-VOTING",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                
                const Text(
                  "STUDENT UNION GOVERNMENT ELECTION",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

            
                const Text(
                  "Choose the member of the SUG for the next academic year",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 50),

                
                Expanded(
                  child: ListView.builder(
                    itemCount: candidates.length,
                    itemBuilder: (context, index) {
                      final candidate = candidates[index];
                      return Card(
                        color: Colors.white.withValues(alpha: .85), // Semi-transparent card
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  candidate["image"]!,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      candidate["name"]!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      candidate["bio"]!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          
        ),
      ),
    );
  }
}
