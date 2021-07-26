import 'package:flutter/material.dart';
import 'package:tipcalculator/movielist.dart';
import 'package:tipcalculator/movielist.dart';

class MovieApp extends StatelessWidget {
  final List<Movie> movieList=Movie.getmovies() ; 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text("MOVIE"),
    ),
    backgroundColor: Colors.grey[900],

    
    body:ListView.builder(
      itemCount: 2,
      
      itemBuilder: (BuildContext context, int index)
    { return Stack(
      children: [
               
          Positioned(
            
            child: moviecard(movieList[index], context)),
         Positioned(
            top: 6,
           child: movieImage(movieList[index].poster)),
      
     
      ]
      ) ;
     // return Card(
      
      
        
      //  child: 
      //  ListTile(
         
       //   onTap: () {
        //    Navigator.push(context, MaterialPageRoute(builder: (context)=>Moviedetail(moviename: movieList[index].title,movie: movieList[index],)) ) ;
        //  },
        //  leading: CircleAvatar(
       //     child: 
        //    Container(
          
          //    decoration: BoxDecoration(
           //     borderRadius: BorderRadius.circular(13),
                
          //      image:DecorationImage(image: NetworkImage(movieList[index].poster),
         //       fit: BoxFit.cover)
        //      ),
       //     ),
      //    ),
     //     trailing: Text("..."),
      //    title: Text(movieList[index].title),
    //      subtitle: Text(movieList[index].director)
  //        ,),
 //   ) ; 
 
    }
    
    )
      
    );
  }

  Widget moviecard(Movie movie,BuildContext context ) {

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context)=>Moviedetail( movie: movie)) ) ; 
      },
      child:Container(
        margin: EdgeInsets.only(left: 40),
        width:MediaQuery.of(context).size.width,
        height: 120,
        
        child: Card(
         color: Colors.grey[800],
          child: Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8,left: 54,right: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(movie.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
                      
                      
                      ),
                    ),
                     Text("Rating ${movie.imbdrating}/10",style: text123())
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Released ${movie.released}",style: text123(),),
                   Text(movie.runtime,style: text123()),
                   Text(movie.rated,style: text123(),)
                  ],
                )
               
                ],
              ),
            ),
          ),
        ),

      )
    ) ; 
  }   
   
   TextStyle text123() {
     return TextStyle(fontSize: 15,color: Colors.grey[200]) ;
   }
   Widget movieImage(String imgurl) {
     return Container(
       width:110,
       height: 110,
       decoration: BoxDecoration(
         shape: BoxShape.circle,
         image: DecorationImage(image: NetworkImage(imgurl),
         fit: BoxFit.cover)
       ),
     ) ;
   }
}

class Moviedetail extends StatelessWidget {

  final Movie movie ;

  const Moviedetail({Key? key,required this.movie}) : super(key: key); 
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        
      ),
     body: ListView(children: [
       moviethumbnail(thumbnail: movie.poster),
       movieheaderposter(movie:movie,),
       moviecast(movie: movie),
       Divider(
height:4
       ),
       movieextraposters(posters: movie.images)

     ],),
      
    );
  }
}

class moviethumbnail extends StatelessWidget {
   final String thumbnail ;

  const moviethumbnail({Key? key,required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(thumbnail),
                fit: BoxFit.cover)
              ),
            ),
            Icon(Icons.play_circle_outline,size: 100,color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            ) 
          ),
          height: 80,
        )

      ],
      
    );
  }
}

class movieheaderposter extends StatelessWidget {
  final Movie movie ;

  const movieheaderposter({Key? key,required this.movie}) : super(key: key); 
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster:movie.poster.toString()),
          SizedBox(width: 16,),
          Expanded(child: MoviedetailHeader(movie:movie))
        ],

        
      ),
    );
  }
}


class MoviePoster extends StatelessWidget {
  final String poster ;

  const MoviePoster({Key? key,required this.poster}) : super(key: key); 


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(poster),
            fit: BoxFit.cover)
          ),
        ),
      ),
      
    );
  }
}

class MoviedetailHeader extends StatelessWidget {
  final Movie movie ;

  const MoviedetailHeader({Key? key, required this.movie}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Column(  
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.released},${movie.genre.toUpperCase()}",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.cyan),
        ),
        Text(movie.title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 32),
        ),
        Text.rich(TextSpan(style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),
        children: [
          TextSpan(
            text: movie.plot
          )

        ]))
      ],
      
    );
  }
}

class moviecast extends StatelessWidget {
 final Movie movie  ; 

  

  const moviecast({Key? key, required this.movie}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0),
      child: Column(
        children: [
          Moviefiled(field:"Cast",value:movie.actors),
          Moviefiled(field:"directors",value:movie.director)

        ],
        
      ),
    );
  }
}

class Moviefiled extends StatelessWidget {
  final String field ; 
  final String value ;

  const Moviefiled({Key? key, required this.field, required this.value}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field : ",style: TextStyle(color: Colors.black38,fontSize: 12,fontWeight: FontWeight.w300)),
        Expanded(child: Text(value,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300)))
      
       ] );
  }
}

class movieextraposters extends StatelessWidget {
  final List posters ;

  const movieextraposters({Key? key,required this.posters}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("More Movie posters".toUpperCase(),style: TextStyle(fontSize: 14,color: Colors.black45),),
        Container(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index)=>ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width/4,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(posters[index]),
                fit: BoxFit.cover)
              ),
              
              ),
            ), 
          separatorBuilder: (context,index)=>SizedBox(width: 8,), 
          itemCount:posters.length),
        )
      ],
      
    );
  }
}