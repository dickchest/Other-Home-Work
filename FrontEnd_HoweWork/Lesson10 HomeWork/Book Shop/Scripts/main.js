"use strict";
print = console.log
console.log("home work 10");

var arrBooks = [];

arrBooks[0] = {
    id: 1000,
    name: "Властели́н коле́ц",
    author: "Джон Р. Р. Толкин",
    description: " (англ. The Lord of the Rings) — роман-эпопея английского писателя Дж. Р. Р. Толкина, одно из самых известных произведений жанра фэнтези. «Властелин колец» был написан как единая книга, но из-за объёма при первом издании его разделили на три части — «Братство Кольца», «Две крепости» и «Возвращение короля». В виде трилогии он публикуется и по сей день, хотя часто в едином томе. Роман считается первым произведением жанра эпическое фэнтези, а также его классикой.",
    photo: "https://upload.wikimedia.org/wikipedia/ru/thumb/8/82/%D0%91%D1%80%D0%B0%D1%82%D1%81%D1%82%D0%B2%D0%BE_%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%B0.gif/253px-%D0%91%D1%80%D0%B0%D1%82%D1%81%D1%82%D0%B2%D0%BE_%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%B0.gif",
    price: 10,
    discount: 10,  
}
arrBooks[1] = {
    id: 1000,
    name: "Гордость и предубеждение",
    author: "Джейн Остин",
    description: "Роман начинается с беседы мистера и миссис Беннет о приезде молодого мистера Бингли в Незерфилд-парк. Жена уговаривает мужа навестить соседа и свести с ним более тесное знакомство. Она надеется, что мистеру Бингли непременно понравится одна из их пяти дочерей. Мистер Беннет наносит визит молодому человеку, и тот через какое-то время наносит ответный.",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/PrideAndPrejudiceTitlePage.jpg/371px-PrideAndPrejudiceTitlePage.jpg",
    price: 10,
    discount: 10,  
}
arrBooks[2] = {
    id: 1000,
    name: "Автостопом по галактике",
    author: "Дуглас Адамс",
    description: "«Тёмные начала» (англ. His Dark Materials) — фантастическая трилогия Филипа Пулмана. Включает романы «Северное сияние», «Чудесный нож» и «Янтарный телескоп». В списке 200 лучших книг по версии BBC трилогия занимает третье место.",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/The_Hitchhiker%27s_Guide_to_the_Galaxy%2C_english.svg/349px-The_Hitchhiker%27s_Guide_to_the_Galaxy%2C_english.svg.png",
    price: 10,
    discount: 10,  
}
arrBooks[3] = {
    id: 1000,
    name: "Гарри Поттер и Кубок огня",
    author: "Джоан Роулинг",
    description: "Га́рри По́ттер и Ку́бок огня́ (англ. Harry Potter and the Goblet of Fire) — четвёртая книга о приключениях Гарри Поттера, написанная английской писательницей Джоан Роулинг. В Англии опубликована в 2000 году. По сюжету Гарри Поттер против своей воли вовлекается в участие в Турнире Трёх Волшебников, и ему предстоит не только сразиться с более опытными участниками, но и разгадать загадку того, как он вообще попал на турнир вопреки правилам.",
    photo: "https://upload.wikimedia.org/wikipedia/ru/c/c7/Harry_Potter_and_the_Goblet_of_Fire.jpg",
    price: 10,
    discount: 10,  
}
arrBooks[4] = {
    id: 1000,
    name: "Убить пересмешника",
    author: "Харпер Ли",
    description: "«Уби́ть пересме́шника» (англ. To Kill a Mockingbird) — роман-бестселлер[2][3] американской писательницы Харпер Ли, опубликованный в 1960 году, за который в 1961 году она получила Пулитцеровскую премию. Её успех стал вехой в борьбе за права чернокожих.",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg/411px-To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg",
    price: 10,
    discount: 10,  
}
arrBooks[5] = {
    id: 1000,
    name: "Винни Пух",
    author: "Алан Александр Милн",
    description: "«Ви́нни-Пух» (англ. Winnie-the-Pooh) — детская повесть Алана Милна, впервые опубликованная в 1926 году. Иллюстратором первого издания выступил известный художник Эрнест Шепард[1]. Первая из двух повестей о приключениях Винни-Пуха и его друзей (вторая — «Дом на Пуховой опушке[en]», вышла в 1928 году). По книге было снято несколько художественных фильмов, полнометражных мультфильмов, мультсериалов, сделан ряд видеоигр.",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Winnie_the_Pooh_-_Google_Art_Project.jpg/411px-Winnie_the_Pooh_-_Google_Art_Project.jpg",
    price: 10,
    discount: 10,  
}
arrBooks[6] = {
    id: 1000,
    name: "1984",
    author: "Джордж Оруэлл",
    description: "Роман «1984» наряду с такими произведениями, как «Мы» Евгения Замятина (1920), «О дивный новый мир» Олдоса Хаксли (1932) и «451 градус по Фаренгейту» Рэя Брэдбери (1953) считается одним из образцов антиутопии[5].",
    photo: "https://upload.wikimedia.org/wikipedia/ru/0/0e/1984_%28first_book-cover%29.jpg",
    price: 10,
    discount: 10,  
}
arrBooks[7] = {
    id: 1000,
    name: "Лев, колдунья и платяной шкаф",
    author: "Клайв Стэйплз Льюис",
    description: "«Лев, колду́нья и платяно́й шкаф» (англ. The Lion, the Witch and the Wardrobe) — первая (вторая по внутренней хронологии) книга серии «Хроники Нарнии» Клайва Стейплза Льюиса. Выпущена в 1950 году. Входит в 100 лучших романов на английском языке по рейтингу журнала Time[1].",
    photo: "https://upload.wikimedia.org/wikipedia/ru/e/e2/The_lion%2C_the_witch_and_the_wardrobe.jpg",
    price: 10,
    discount: 10,  
}
arrBooks[8] = {
    id: 1000,
    name: "Джейн Эйр",
    author: "Шарлотта Бронте",
    description: "«Джейн Эйр» (англ. Jane Eyre [ˌdʒeɪn ˈɛər]), в самой первой публикации был выпущен под названием «Джейн Эйр: Автобиография» (англ. Jane Eyre: An Autobiography) — роман английской писательницы Шарлотты Бронте, выпущенный под псевдонимом «Каррер Белл». Второе переиздание романа Бронте посвятила писателю Уильяму Теккерею.",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Jane_Eyre_title_page.jpg/285px-Jane_Eyre_title_page.jpg",
    price: 10,
    discount: 10,  
}
arrBooks[9] = {
    id: 1000,
    name: "Уловка-22",
    author: "Джозеф Хеллер",
    description: "«Уловка-22» (англ. Catch-22) — роман американского писателя Джозефа Хеллера, опубликованный в 1961 году. Известен возникшим в нём логическим парадоксом между взаимоисключающими правилами «Уловка-22».",
    photo: "https://upload.wikimedia.org/wikipedia/ru/thumb/e/e1/%D0%9E%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0_%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE_%D0%B8%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D1%8F_%D0%94%D0%B6%D0%BE%D0%B7%D0%B5%D1%84%D0%B0_%D0%A5%D0%B5%D0%BB%D0%BB%D0%B5%D1%80%D0%B0_%C2%AB%D0%A3%D0%BB%D0%BE%D0%B2%D0%BA%D0%B0-22%C2%BB.jpg/411px-%D0%9E%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0_%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE_%D0%B8%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D1%8F_%D0%94%D0%B6%D0%BE%D0%B7%D0%B5%D1%84%D0%B0_%D0%A5%D0%B5%D0%BB%D0%BB%D0%B5%D1%80%D0%B0_%C2%AB%D0%A3%D0%BB%D0%BE%D0%B2%D0%BA%D0%B0-22%C2%BB.jpg",
    price: 10,
    discount: 10,  
}

// функция для нахождения случайного целого числа от мин до макс
function randomInteger(min, max) {
    return Math.floor(Math.random()*(max-min)+min);
}


// цикл для автоматического дозаполнения элементов обектов
for (let i=0; i< arrBooks.length; i++) {
    arrBooks[i].id += i;
    arrBooks[i].price = randomInteger(10, 250);
    arrBooks[i].discount = randomInteger(0, 15);
    arrBooks[i].link = function() { return `books/item-${this.id}`;};
    arrBooks[i].discountPrice = function () { return !(this.discount) ? this.price : Math.floor(this.price * (1 + this.discount/100)); };
}

let arrayArticles = document.querySelectorAll("main article");

for(let i=0; i<arrayArticles.length;i++) {
    arrayArticles[i].querySelector("h2").innerText=arrBooks[i].name;
    arrayArticles[i].querySelector("h3").innerText=arrBooks[i].author;
    arrayArticles[i].querySelector("p").innerText=arrBooks[i].description;
    arrayArticles[i].querySelector("img").setAttribute('src',arrBooks[i].photo);
    arrayArticles[i].querySelector("span").innerText="Цена: " + arrBooks[i].discountPrice() + " Евро";
    arrayArticles[i].querySelector("a").setAttribute('href', "#" + arrBooks[i].link());
}