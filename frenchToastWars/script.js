var xmlhttp = new XMLHttpRequest();
var url = "assignments.json";
var frenchToasters;
var largestToaster;
var maxSpeed;

xmlhttp.onreadystatechange = function() {
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        var data = JSON.parse(xmlhttp.responseText);

        assign(data);
    }
}


    xmlhttp.open("GET", url, true);
	xmlhttp.send();

function assign(data){
	console.log(data);
	frenchToasters = data.toastData.howMany;
	largestToaster = data.toastData.largestSize;
	maxSpeed = data.toastData.fastest;	

}
document.onreadystatechange = function () {

    if (document.readyState == "complete") {
        initApplication();

    }
}


function initApplication(){

        console.log(largestToaster);

	/*var frenchToasters = window.prompt("How many warriors per wave in the French Toast Army?", 25);
	var largestToaster = window.prompt("How large is the largest French Toaster?", 100);
	var maxSpeed = window.prompt("How fast is the fastest French Toaster?", 50);*/




	var explosionSound;
	explosionSound = document.getElementById("bombSound");
	this.spaceBattle = new Battle(frenchToasters, largestToaster, maxSpeed);

	spaceBattle.hasBattleStarted = true;

	setInterval("this.spaceBattle.updateBattle()", 1000/24);

											WebFontConfig = {
					    google: { families: [ 'Creepster::latin' ] }
					  };
					  (function() {
					    var wf = document.createElement('script');
					    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
					      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
					    wf.type = 'text/javascript';
					    wf.async = 'true';
					    var s = document.getElementsByTagName('script')[0];
					    s.parentNode.insertBefore(wf, s);
					  })();
}

function Battle(numberOfWarriors, largestToaster, maxSpeed){
	this.numWarriors = numberOfWarriors;
	this.lrgToast = largestToaster;
	this.maxSpeed = maxSpeed;
	this.warriors = []; //array of warrior objects
	this.hasBattleStarted = false;
	this.battlefield = new battlefield(); //this is the canvas 


	for(var i = 0; i<this.numWarriors; i++){
		var tempWarrior = new Warrior(i, this.lrgToast, this.maxSpeed);
		this.warriors[i] = tempWarrior;
	}
}

Battle.prototype.updateBattle = function(){
	if(this.hasBattleStarted){
		//console.log("updating");
		for(var i = 0; i < this.numWarriors; i++){
			this.warriors[i].updateWarrior();
			this.warriors[i].drawWarrior(i, this.battlefield, this.numWarriors);
		}
	}
}

function Warrior(warriorNumber, largestToaster, maximumSpeed){
	var self = this;
	self.name = "Warrior" + warriorNumber + 1;
	self.color = [ Math.floor(Math.random()*255) , Math.floor(Math.random()*255) , Math.floor(Math.random()*255) ];
	self.size = Math.floor(Math.random()*largestToaster);

	var startPosition = -100;
	self.position = startPosition;
	self.yPos = 0;

	self.speed = 1;
	self.acceleration = Math.floor(Math.random()*10);

	self.maxSpeed = maximumSpeed;

	var earth = new Image();
	earth.src = "earth.gif";
	var earthHitPoints = 50;
	var toastWin = new Image();
	toastWin.src = "realtoast.gif";			
	var toastWinSize = 200;
	var eye = new Image();
	eye.src = "eye.gif";
	var bgImage = new Image();
	bgImage.src = "stars.jpg";
	var img = new Image();
	img.src = "nyan.gif";
	var explosion = new Image();
	explosion.src = "explosion.gif";

	var counter = 0;



	self.updateWarrior = function (){
		if(self.speed <= self.maxSpeed){
			self.speed += self.acceleration;
		}

		self.position += self.speed;

		// if (self.yPos < 100) {
		// 	self.yPos += 5;
		// } else {
		// 	if self.yPos > -100) {
		// 	self.yPos -= 5;}
		// }



//for ( i = 0; i <= 1; i += 0.01 ) {
  self.yPos = (Math.sin(counter)*10);
  counter += 0.3;
//}


		if(self.position >= window.innerWidth) {

			this.numWarriors += 100;
			this.hasBattleStarted = true;
			self.position = startPosition;


					var flash = new Image();
		flash.src = "flash.gif";
		}
	}

	self.drawWarrior = function (_battleNumber, canvas, warriorSpread){
		//console.log("drawing");
		if (_battleNumber == 0) {
				//canvas.context.fillStyle = "rgb(255,255,255)";

			canvas.context.globalAlpha = 0.7;
	    	canvas.context.drawImage(bgImage, 0, 0, window.innerWidth, window.innerHeight);
			canvas.context.globalAlpha = 1.0;


			canvas.context.drawImage(eye, 165, 150, 200, 170);

			// if(earthHitPoints < 0) {
			// 	//earth.src = "realtoast.gif";
			// 	canvas.context.drawImage(toastWin, window.innerWidth * 0.75, window.innerHeight * 0.5, 200, 200);
			
			// 	console.log("FRENCH TOAST WINS");
			// } else {
				canvas.context.drawImage(earth, window.innerWidth * 0.75, window.innerHeight * 0.5, 200, 200);
				//console.log("EARTH SURVIVES");
			// }

		};

		//console.log(canvas.context);


		var adjustedYPos = (_battleNumber * (window.innerHeight/warriorSpread)+10) - self.yPos;
		canvas.context.drawImage (img, self.position, (_battleNumber* (window.innerHeight/warriorSpread)+10) - self.yPos, self.size * 1.5, self.size);
		
		if (self.position > window.innerWidth * 0.75 && adjustedYPos > (window.innerHeight * 0.5 - 100) && adjustedYPos < (window.innerHeight * 0.5 + 100)){

			canvas.context.drawImage(explosion, self.position, adjustedYPos, 200, 200);
			//explosionSound.play();
			//console.log("earth hit points = " + earthHitPoints);
			earthHitPoints -= 1;


		}
								if(earthHitPoints < 0) {
				//earth.src = "realtoast.gif";	
				toastWinSize += 10;
				canvas.context.drawImage(toastWin, window.innerWidth * 0.75 - (0.5*toastWinSize), window.innerHeight * 0.75 - (0.5*toastWinSize), toastWinSize*2, toastWinSize);
				if(toastWinSize > window.innerWidth * 0.5) {
					console.log("FRENCH TOAST WINS");

	      			canvas.context.shadowOffsetX = 4;
	       			canvas.context.shadowOffsetY = 4;
	       			canvas.context.shadowBlur = 5;
	       			canvas.context.shadowColor = "black";
					canvas.context.fillStyle = "red";
          			canvas.context.font="100px Creepster";
					canvas.context.fillText("FRENCH TOAST WINS", window.innerWidth / 4, window.innerHeight / 2);
				}
			}
	}
}

function battlefield(){
	var self = this;
	self.canvas = document.getElementById("battlefieldCanvas");
	self.context = self.canvas.getContext('2d');
	self.canvas.width = window.innerWidth;
	self.canvas.height = window.innerHeight;
}







