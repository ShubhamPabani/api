import 'package:expense_api/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'model/article.dart';

// ignore: camel_case_types
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: ApiService().getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(top: 16),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                          '${snapshot.data![index].urltoImage}',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [

                            Text(snapshot.data![index].title,
                                style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500)),
                            Text(
                              maxLines: 2,
                              '${snapshot.data![index].description}',
                              overflow: TextOverflow.ellipsis,
                              style:const TextStyle(color: Colors.black26),
                            ),

                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          }
          return const Center(child: CircularProgressIndicator(color: Colors.redAccent,));
        },
      ),);
  }
}