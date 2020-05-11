var audioData=[
            {
                title:"Pachchai_Nirame_pachchai_nirame.mp3",
                subtitle:"A.R.Rahman-Alaipayuthe",
                imgsrc:"image/alaypayuthe.png",
                duration:"4.8",
                song:"Songs/Pachchai_Nirame.mp3"
            },
            {
                title:"Jiya Re-Neeti Muhan[48]--Raag.Me--.mp3",
                subtitle:"A.R.Rahman-Jab Tak Hai Jaan",
                imgsrc:"image/jiyare.jpg",
                duration:"5.10",
                song:"Songs/Jiya Re-Neeti Muhan[48]--Raag.Me--.mp3"
            },
            {
                title:"Poo_vaasam_purappadum-StarMusiQ.com.mp3",
                subtitle:"Vidyasagar-Anbesivam",
                imgsrc:"image/anbesivam.jpg",
                duration:"5.45",
                song:"Songs/Poo_Vaasam_Purappadum-StarMusiQ.Com.mp3"
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
