package de.adorsys.opba.core.protocol.service.xs2a.consent.authorize;

import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.delegate.JavaDelegate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.transaction.annotation.Propagation.REQUIRES_NEW;

@Slf4j
@Service("scaExemption")
public class ScaExemption implements JavaDelegate {

    @Override
    @Transactional(propagation = REQUIRES_NEW)
    public void execute(DelegateExecution delegateExecution) {
        log.info("SCA Exemption");
    }
}
