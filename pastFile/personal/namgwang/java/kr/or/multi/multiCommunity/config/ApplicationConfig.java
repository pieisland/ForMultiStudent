package kr.or.multi.multiCommunity.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan(basePackages = { "kr.or.multi.multiCommunity.dao", "kr.or.multi.multiCommunity.service"})
@Import({ DBConfig.class })

public class ApplicationConfig {

}