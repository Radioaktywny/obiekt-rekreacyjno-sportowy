package com.ors;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.thymeleaf.spring4.SpringTemplateEngine;
import org.thymeleaf.spring4.view.ThymeleafViewResolver;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;

@Configuration
public class AppConfig {
    @Bean
    public SpringTemplateEngine templateEngine() {
        SpringTemplateEngine templateEngine = new SpringTemplateEngine();

        ServletContextTemplateResolver templateResolver = new ServletContextTemplateResolver();

        templateResolver.setTemplateMode("HTML5");
        templateResolver.setPrefix("src/main/resources/templates/");
        templateResolver.setSuffix(".html");
        // templateResolver.setCacheTTLMs(3600000L);
        templateResolver.setCacheable(Boolean.FALSE);

        templateEngine.setTemplateResolver(templateResolver);
        return templateEngine;
    }

    @Bean
    public ThymeleafViewResolver thymeleafViewResolver() {
        ThymeleafViewResolver thymeleafViewResolver = new ThymeleafViewResolver();

        thymeleafViewResolver.setTemplateEngine(this.templateEngine());

        return thymeleafViewResolver;
    }
}