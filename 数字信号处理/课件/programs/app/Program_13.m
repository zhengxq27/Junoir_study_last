 % Program 15_13
 % Sigma-Delta D/A Converter Operation
 %
 %clf;
 % Generate the input sinusoidal sequence
 N = input('Type in length of the input sequence = ');
 A = input('Type in amplitude of the input = ');;
 w0 = 2*pi*0.02;
 n = 1:N;
 m = n-1;
 x = A*cos(w0*m);
 axis([0 N -1 1]);
 stem(m,x);
 xlabel('Time index'); ylabel('Amplitude');
 title ('Input digital signal');
 pause
 % Generation of quantized output
 x = (x)/(A);
 y = zeros(1,N+1);
 a = zeros(1,N+1);
 e = 0;
 for k = 2:N+1
    a(k) = x(k-1) - e;
      if a(k) >= 0,
          y(k) = 1;
      else
          y(k) = -1;
      end
    e = y(k) - a(k);
 end
 yn = y(2:N+1);
 axis([0 N -1.2 1.2]);
 stem(m, yn); % Plot the quantized output
 xlabel('Time'); ylabel('Amplitude');
 title ('Digital output of sigma-delta quantizer');
 pause
 Y = fft(yn);
 H = [1 1 0.5 zeros(1,N-5) 0.5 1];% Lowpass filter
 YF = Y.*H; % Filtering in the DFT domain
 out = ifft(YF);
 plot(m,2*out);
 xlabel('Time'); ylabel('Amplitude');
 title ('Lowpass filtered analog output');
