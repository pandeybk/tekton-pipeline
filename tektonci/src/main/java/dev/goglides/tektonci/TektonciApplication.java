package dev.goglides.tektonci;

import java.net.InetAddress;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@SpringBootApplication
public class TektonciApplication {

	private static final String APP_VERSION = "1.0.0";

	public static void main(String[] args) {
		SpringApplication.run(TektonciApplication.class, args);
	}

    @GetMapping("/info")
    public String getAppInfo() throws UnknownHostException {
        InetAddress ip = InetAddress.getLocalHost();
        String hostname = ip.getHostName();
        return "Application Version: " + APP_VERSION + ", Hostname: " + hostname;
    }
}
