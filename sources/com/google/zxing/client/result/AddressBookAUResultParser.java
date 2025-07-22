package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.ArrayList;
import org.apache.commons.p006io.IOUtils;
import org.apache.httpcore.message.TokenParser;

/* loaded from: classes.dex */
public final class AddressBookAUResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public AddressBookParsedResult parse(Result result) {
        String massagedText = getMassagedText(result);
        if (!massagedText.contains("MEMORY") || !massagedText.contains(IOUtils.LINE_SEPARATOR_WINDOWS)) {
            return null;
        }
        String strMatchSinglePrefixedField = matchSinglePrefixedField("NAME1:", massagedText, TokenParser.f299CR, true);
        String strMatchSinglePrefixedField2 = matchSinglePrefixedField("NAME2:", massagedText, TokenParser.f299CR, true);
        String[] strArrMatchMultipleValuePrefix = matchMultipleValuePrefix("TEL", 3, massagedText, true);
        String[] strArrMatchMultipleValuePrefix2 = matchMultipleValuePrefix("MAIL", 3, massagedText, true);
        String strMatchSinglePrefixedField3 = matchSinglePrefixedField("MEMORY:", massagedText, TokenParser.f299CR, false);
        String strMatchSinglePrefixedField4 = matchSinglePrefixedField("ADD:", massagedText, TokenParser.f299CR, true);
        return new AddressBookParsedResult(maybeWrap(strMatchSinglePrefixedField), null, strMatchSinglePrefixedField2, strArrMatchMultipleValuePrefix, null, strArrMatchMultipleValuePrefix2, null, null, strMatchSinglePrefixedField3, strMatchSinglePrefixedField4 != null ? new String[]{strMatchSinglePrefixedField4} : null, null, null, null, null, null, null);
    }

    private static String[] matchMultipleValuePrefix(String str, int i, String str2, boolean z) {
        ArrayList arrayList = null;
        for (int i2 = 1; i2 <= i; i2++) {
            String strMatchSinglePrefixedField = matchSinglePrefixedField(str + i2 + ':', str2, TokenParser.f299CR, z);
            if (strMatchSinglePrefixedField == null) {
                break;
            }
            if (arrayList == null) {
                arrayList = new ArrayList(i);
            }
            arrayList.add(strMatchSinglePrefixedField);
        }
        if (arrayList == null) {
            return null;
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }
}
