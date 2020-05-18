var audioData=[
            {
                title:"Dua Lipa (Deluxe)",
                subtitle:"Don't Start Now - Dua Lipa",
                imgsrc:"image/dualipa.png",
                duration:"3.01",
                song:"Songs/Dua Lipa - Don't Start Now (Official Music Video).mp3"
            },
            {
                title:"Pachchai_Nirame_pachchai_nirame.mp3",
                subtitle:"A.R.Rahman-Alaipayuthe",
                imgsrc:"image/alaypayuthe.png",
                duration:"5.58",
                song:"Songs/Pachchai_Nirame.mp3"
            },
            {
                title:"Jiya Re-Neeti Muhan[48]--Raag.Me--.mp3",
                subtitle:"A.R.Rahman-Jab Tak Hai Jaan",
                imgsrc:"image/jiyare.jpg",
                duration:"5.23",
                song:"Songs/Jiya Re-Neeti Muhan[48]--Raag.Me--.mp3"
            }

        ];
function getIntervel(timeValue){
    var min=timeValue.split('.')[0];
    var sec=timeValue.split('.')[1];
    return parseInt(min*60)+parseInt(sec);
}
function getTimeFromIntervel(intervel){
    var min= parseInt(intervel) / 60
    var sec= parseInt(intervel) - (parseInt(min)*60)
    sec=sec<10 ? "0"+ sec :sec;
    return parseInt(min)+"."+sec;
}
