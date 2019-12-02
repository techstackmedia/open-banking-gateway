package de.adorsys.opba.core.protocol.service.xs2a.consent;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service("consentEvaluator")
@RequiredArgsConstructor
public class ConsentEvaluator {

    public boolean consentAuthorizationNeeded() {
        return true;
    }
}
