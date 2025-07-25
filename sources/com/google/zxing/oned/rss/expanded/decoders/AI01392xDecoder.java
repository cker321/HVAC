package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;

/* loaded from: classes.dex */
final class AI01392xDecoder extends AI01decoder {
    private static final int HEADER_SIZE = 8;
    private static final int LAST_DIGIT_SIZE = 2;

    AI01392xDecoder(BitArray bitArray) {
        super(bitArray);
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder
    public String parseInformation() throws NotFoundException, FormatException {
        if (getInformation().getSize() < 48) {
            throw NotFoundException.getNotFoundInstance();
        }
        StringBuilder sb = new StringBuilder();
        encodeCompressedGtin(sb, 8);
        int iExtractNumericValueFromBitArray = getGeneralDecoder().extractNumericValueFromBitArray(48, 2);
        sb.append("(392");
        sb.append(iExtractNumericValueFromBitArray);
        sb.append(')');
        sb.append(getGeneralDecoder().decodeGeneralPurposeField(50, null).getNewString());
        return sb.toString();
    }
}
