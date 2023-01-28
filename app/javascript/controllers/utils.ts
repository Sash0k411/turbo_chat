
export const beep = () => {
  const context = new AudioContext();
  const oscillator = context.createOscillator();
  oscillator.type = "sine";
  oscillator.frequency.value = 800;
  oscillator.connect(context.destination);
  oscillator.start();

  setTimeout(function () {
    oscillator.stop();
  }, 200);
}

export const highlightElement = (element) => {
  element.classList.add('border-amber-700');
  setTimeout(() => {
    element.classList.add('border-amber-700');
  },1000);
}