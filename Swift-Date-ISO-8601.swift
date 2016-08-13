/*
 ******************************************************
 *
 *  The MIT License (MIT)
 *
 *  Copyright (c) 2016 Joe Ferrucci <http://joeferrucci.info>
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 *****************************************************
 */

import Foundation

public extension NSDate {
    public class func ISOStringFromDate(date: NSDate, locale: String = "en_US_POSIX", timezone: String = "UTC") -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: locale)
        dateFormatter.timeZone = NSTimeZone(abbreviation: timezone)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        /*
        *  Append Z in lieu of putting into dateFormat.
        *  This will prevent UTC Offset +0000 from displaying.
        */
        return dateFormatter.stringFromDate(date).stringByAppendingString("Z")
    }
    
    public class func dateFromISOString(string: String, locale: String = "en_US_POSIX") -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return dateFormatter.dateFromString(string)
    }
    
    public class func isoStringNow() -> String {
        return NSDate.ISOStringFromDate(NSDate())
    }
}
