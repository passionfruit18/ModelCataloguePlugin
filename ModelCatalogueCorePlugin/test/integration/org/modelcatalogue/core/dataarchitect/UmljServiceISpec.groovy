package org.modelcatalogue.core.dataarchitect

import grails.test.spock.IntegrationSpec
import org.modelcatalogue.core.AbstractIntegrationSpec
import org.modelcatalogue.core.Classification
import org.modelcatalogue.core.Model
import org.springframework.transaction.TransactionStatus
import spock.lang.Ignore

class UmljServiceISpec extends AbstractIntegrationSpec {

    def umljService, initCatalogueService


    def "test import"() {
        initCatalogueService.initCatalogue()
        def filenameXsd = "test/integration/resources/rare_diseases_combined.umlj"
        Classification classification = new Classification(name: "rare_diseases_combined").save()

        when:
        InputStream inputStream = new FileInputStream(filenameXsd)
        umljService.importUmlDiagram(inputStream, "rare_diseases_combined", classification)

        def patient = Model.findByName("Patient")
        def patientData = patient.contains
        def de4 = patientData[4]

        then:
        patient
        de4

    }
}
