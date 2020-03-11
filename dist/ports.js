// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

function activatePorts(app, containerSize) {
	// Inform the Elm app when its container div gets resized.
	// window.addEventListener("resize", () =>
	// 	app.ports.resizes.send(containerSize())
	// );

	// Replace elm Browser.onAnimationFrameDelta
	// startAnimationFrameLoop(app.ports.animationFrame);
	app.ports.export.subscribe( (svgId) => {
		svg = document.getElementById(svgId);
		console.log(svg.outerHTML);
	});
}

function startAnimationFrameLoop(port) {
	let timestamp = performance.now();
	let loop = (time) => {
		window.requestAnimationFrame(loop);
		let delta = time - timestamp;
		timestamp = time;
		port.send(delta);
	}
	loop();
}

function download(filename, text) {
	var element = document.createElement('a');
	element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
	element.setAttribute('download', filename);
	element.style.display = 'none';
	document.body.appendChild(element);
	element.click();
	document.body.removeChild(element);
}
