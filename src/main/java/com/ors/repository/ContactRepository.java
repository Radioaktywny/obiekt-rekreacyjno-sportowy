package com.ors.repository;

import com.ors.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by DuduŚ on 2016-12-16.
 */
public interface ContactRepository extends JpaRepository<Contact, Long> {
}
