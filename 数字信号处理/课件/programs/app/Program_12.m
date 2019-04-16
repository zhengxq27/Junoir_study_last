     % Program 12
     % Sigma-Delta A/D Converter Operation
     %
     wo = 2*pi*0.01;
     N = input('Type in the length of input sequence = ');
     n = 1:1:N;
     m = n-1;
     A = input('Type in the amplitude of the input = ');
     x = A*cos(wo*m);
     axis([0 N-1 -1.2 1.2]);
     plot(m,x);
     xlabel('Time'); ylabel('Amplitude');
     title('Input analog signal');
     pause
     y = zeros(1,N+1);
     v0 = 0;
     for k = 2:1:N+1;
     v1 = x(k-1) - y(k-1) + v0;
         if v1 >= 0;
           y(k) = 1;
         else
           y(k) = -1;
         end
     v0 = v1;
     end
     yn = y(2:N+1);
     axis([0 N-1 -1.2 1.2]);
     stairs(m, yn);
     xlabel('Time'); ylabel('Amplitude');
     title('Output of sigma-delta quantizer');
     Y = fft(yn);
     pause
     H = [1 1 0.5 zeros(1,N-5) 0.5 1];
     YF = Y.*H;
     out = ifft(YF);
     axis([0 N-1 -1.2 1.2]);
     plot(m,out);
     xlabel('Time'); ylabel('Amplitude');
     title('Lowpass filtered output');
