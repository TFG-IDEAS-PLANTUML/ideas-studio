/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.us.isa.ideas.app.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.support.ServletContextAttributeExporter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.HashMap;

/**
 * @author japarejo
 */
@Configuration
public class StudioConfigurationInitializator implements WebMvcConfigurer {

    @Bean(name = "studioConfiguration")
    public StudioConfiguration load(@Value("#{servletContext.getRealPath('')}") String path) {
        return StudioConfiguration.load(path);
    }

    @Bean
    public ServletContextAttributeExporter initializeGlobalStudioConfiguration(StudioConfiguration studioConfiguration) {
        ServletContextAttributeExporter result = new ServletContextAttributeExporter();
        result.setAttributes(new HashMap<String, Object>() {{
            put("studioConfiguration", studioConfiguration);
        }});

        return result;
    }

}
