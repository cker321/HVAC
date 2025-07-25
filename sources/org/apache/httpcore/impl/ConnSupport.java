package org.apache.httpcore.impl;

import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CodingErrorAction;
import org.apache.httpcore.config.ConnectionConfig;

/* loaded from: classes.dex */
public final class ConnSupport {
    public static CharsetDecoder createDecoder(ConnectionConfig connectionConfig) {
        if (connectionConfig == null) {
            return null;
        }
        Charset charset = connectionConfig.getCharset();
        CodingErrorAction malformedInputAction = connectionConfig.getMalformedInputAction();
        CodingErrorAction unmappableInputAction = connectionConfig.getUnmappableInputAction();
        if (charset == null) {
            return null;
        }
        CharsetDecoder charsetDecoderNewDecoder = charset.newDecoder();
        if (malformedInputAction == null) {
            malformedInputAction = CodingErrorAction.REPORT;
        }
        CharsetDecoder charsetDecoderOnMalformedInput = charsetDecoderNewDecoder.onMalformedInput(malformedInputAction);
        if (unmappableInputAction == null) {
            unmappableInputAction = CodingErrorAction.REPORT;
        }
        return charsetDecoderOnMalformedInput.onUnmappableCharacter(unmappableInputAction);
    }

    public static CharsetEncoder createEncoder(ConnectionConfig connectionConfig) {
        Charset charset;
        if (connectionConfig == null || (charset = connectionConfig.getCharset()) == null) {
            return null;
        }
        CodingErrorAction malformedInputAction = connectionConfig.getMalformedInputAction();
        CodingErrorAction unmappableInputAction = connectionConfig.getUnmappableInputAction();
        CharsetEncoder charsetEncoderNewEncoder = charset.newEncoder();
        if (malformedInputAction == null) {
            malformedInputAction = CodingErrorAction.REPORT;
        }
        CharsetEncoder charsetEncoderOnMalformedInput = charsetEncoderNewEncoder.onMalformedInput(malformedInputAction);
        if (unmappableInputAction == null) {
            unmappableInputAction = CodingErrorAction.REPORT;
        }
        return charsetEncoderOnMalformedInput.onUnmappableCharacter(unmappableInputAction);
    }
}
