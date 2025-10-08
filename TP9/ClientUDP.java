import java.io.*;
import java.net.*;

public class ClientUDP{
	public static void main (String[] args ) {
		try {
			String s = "Hello World";
			byte[] data = s.getBytes();

			InetAddress addr = InetAddress.getLocalHost();
			System.out.println( "adesse=" +addr.getHostName() );

			DatagramPacket packet = new DatagramPacket( data, data.length, addr, 1234 );

			DatagramSocket sock = new DatagramSocket();
			sock.send(packet);
			System.out.println("Message envoyés !");

			byte[] buffer = new byte[1024];
			DatagramPacket response = new DatagramPacket(buffer, buffer.length);
			sock.receive(response);
			String reply = new String(response.getData(), 0, response.getLength());
			System.out.println("Réponse reçue du serveur : " + reply);

			sock.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

