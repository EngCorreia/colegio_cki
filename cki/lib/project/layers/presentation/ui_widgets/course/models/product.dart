class Product {
  final int? id, price;
  final String? title, description, image;

  Product({this.id, this.price, this.title, this.description, this.image});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,
    price: 30000,
    title: "1ª Classe: kalabo Internacional",
    image: "assets/course/course4.png",
    description:
    "Faça agora sua inscrição. Para a 1ª classe temos o seguinte período  Manhã das 8h00 as 12h00 de segunda-feira á sexta-feira",
  ),
  Product(
    id: 4,
    price: 30000,
    title: "2ª Classe: kalabo Internacional",
    image: "assets/course/course2.png",
    description:
    "Faça agora sua inscrição. Para a 2ª classe temos o seguinte período  Manhã das 8h00 as 12h00 de segunda-feira á sexta-feira",
  ),
  Product(
    id: 9,
    price: 30000,
    title: "3ª Classe: kalabo Internacional",
    image: "assets/course/course3.png",
    description:
        "Faça agora sua inscrição. Para a 3ª classe temos o seguinte período  Manhã das 8h00 as 12h00 de segunda-feira á sexta-feira",
  ),


  Product(
    id: 15,
    price: 30000,
    title: "4ª Classe: kalabo Internacional",
    image: "assets/course/course8.png",
    description:
    "Faça agora sua inscrição. Para a 4ª classe temos o seguinte período  Manhã das 8h00 as 12h00 de segunda-feira á sexta-feira",
  ),

  Product(
    id: 11,
    price: 30000,
    title: "5ª Classe: kalabo Internacional",
    image: "assets/course/course6.png",
    description:
    "Faça agora sua inscrição. Para a 5ª classe temos o seguinte período  Manhã das 8h00 as 12h00 de segunda-feira á sexta-feira",
  ),

  Product(
    id: 10,
    price: 30000,
    title: "6ª Classe: kalabo Internacional",
    image: "assets/course/course5.png",
    description:
    "Faça agora sua inscrição. Para a 6ª classe temos o seguinte período  Manhã das 8h00 as 12h00 de segunda-feira á sexta-feira",
  ),


];
